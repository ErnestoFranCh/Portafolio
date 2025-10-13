/* ===============================================
   ANÁLISIS DE COMPORTAMIENTO DE CLIENTES
   SCRIPT PRINCIPAL: MÉTRICAS DE COMPRA Y FRECUENCIA
   =============================================== */

-- =============================================================================
-- 1. ANÁLISIS DEL TIEMPO PROMEDIO ENTRE COMPRAS EN DÍAS POR CADA CLIENTE
-- =============================================================================

/* ----------------------------------------------------------------------------
   SECCIÓN 1.1: VISTA DE PROMEDIO DE DÍAS ENTRE COMPRAS
   Objetivo: Crear vista que calcula el tiempo promedio entre compras por cliente
   ---------------------------------------------------------------------------- */
CREATE VIEW VPRomedioDiasCompra AS
SELECT
    IdCustomer,
    AVG(OrderDate - PreviousOrderDate) AS PromedioDiasEntreCompras
FROM (
    SELECT
        ft.IdCustomer,
        ft.OrderDate,
        LAG(ft.OrderDate) OVER (PARTITION BY ft.IdCustomer ORDER BY ft.OrderDate) AS PreviousOrderDate
    FROM facttransaction ft
) AS ComprasConAnterior
WHERE PreviousOrderDate IS NOT NULL
GROUP BY IdCustomer
ORDER BY PromedioDiasEntreCompras ASC;

/* ----------------------------------------------------------------------------
   SECCIÓN 1.2: ANÁLISIS DE CLIENTES FALTANTES
   Objetivo: Identificar y analizar clientes que no aparecen en el promedio de compras
   ---------------------------------------------------------------------------- */

-- Identificar clientes sin promedios de compra
CREATE TEMP TABLE ClientesSinPromedio AS 
SELECT idcustomer
FROM customers
WHERE idcustomer NOT IN (
    SELECT IdCustomer FROM VPRomedioDiasCompra
);

-- Detallar compras de clientes faltantes
CREATE TEMP TABLE Clientesfaltantes AS
SELECT 
    sub.idcustomer,
    sub.quantity,
    sub.orderdate
FROM (
    SELECT 
        f.idcustomer,
        f.orderdate,
        s.quantity
    FROM facttransaction f
    INNER JOIN sales s ON f.idorder = s.idorder
) AS sub
WHERE sub.idcustomer IN (
    SELECT idcustomer FROM ClientesSinPromedio
);

-- Análisis exploratorio: Clientes con una sola compra
SELECT *
FROM Clientesfaltantes
ORDER BY orderdate ASC; -- Notamos que no tienen promedio pues solo realizaron una compra

/* ----------------------------------------------------------------------------
   SECCIÓN 1.3: ANÁLISIS ESTADÍSTICO - CUARTILES DE FRECUENCIA DE COMPRA
   Objetivo: Calcular cuartiles para entender la distribución del comportamiento de compra
   ---------------------------------------------------------------------------- */
SELECT
    percentile_cont(0.25) WITHIN GROUP (ORDER BY PromedioDiasEntreCompras) AS Q1,
    percentile_cont(0.50) WITHIN GROUP (ORDER BY PromedioDiasEntreCompras) AS Q2,
    percentile_cont(0.75) WITHIN GROUP (ORDER BY PromedioDiasEntreCompras) AS Q3
FROM VPRomedioDiasCompra;

-- =============================================================================
-- 2. ANÁLISIS DEL PROMEDIO DE UNIDADES COMPRADAS SEMESTRALMENTE POR CLIENTE
-- =============================================================================

/* ----------------------------------------------------------------------------
   SECCIÓN 2.1: VISTA DE PROMEDIO SEMESTRAL DE UNIDADES COMPRADAS
   Objetivo: Crear vista que calcula el promedio de unidades por cliente por semestre
   Periodo: 2014-2017
   ---------------------------------------------------------------------------- */
CREATE VIEW VPRomedioSemestralCantidad AS
SELECT 
    idcustomer,
    AVG(PromedioUnidades) as PromedioSemestral
FROM (
    SELECT 
        f.Idcustomer,
        c.Year,
        CASE 
            WHEN c.Quarter IN ('Q1', 'Q2') THEN 'S1'
            WHEN c.Quarter IN ('Q3', 'Q4') THEN 'S2'
        END AS Semestre,
        AVG(s.Quantity) AS PromedioUnidades
    FROM facttransaction f
    JOIN Calendario c ON f.OrderDate = c.Date
    JOIN Sales s ON f.IdOrder = s.IdOrder
    WHERE c.Year BETWEEN '2014' AND '2017'
    GROUP BY f.Idcustomer, c.Year, Semestre
    ORDER BY f.Idcustomer, c.Year, Semestre
) AS Subquery
GROUP BY idcustomer;

/* ----------------------------------------------------------------------------
   SECCIÓN 2.2: ANÁLISIS ESTADÍSTICO - CUARTILES DE CANTIDAD COMPRADA
   Objetivo: Calcular cuartiles para entender la distribución de unidades compradas
   ---------------------------------------------------------------------------- */
SELECT
    percentile_cont(0.25) WITHIN GROUP (ORDER BY PromedioSemestral) AS Q1,
    percentile_cont(0.50) WITHIN GROUP (ORDER BY PromedioSemestral) AS Q2,
    percentile_cont(0.75) WITHIN GROUP (ORDER BY PromedioSemestral) AS Q3
FROM VPRomedioSemestralCantidad;

/* ===============================================
   FIN DEL SCRIPT DE ANÁLISIS DE CLIENTES
   =============================================== */