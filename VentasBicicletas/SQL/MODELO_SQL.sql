/* ===============================================
            Creacion de tablas
   =============================================== */

CREATE TABLE Clientes
(IdCliente text PRIMARY KEY,
Correo_Electronico text,
Nombre_Cliente text,
Apellido text,
Fecha_Nacimiento date,
Estado_Civil text,
Genero text,
Ingreso_Anual int,
Numero_Hijos int,
Nivel_Educativo text,
Ocupacion text,
Propietario_Casa text,
Nivel_Ingreso_Anual text);

CREATE TABLE Productos
(SKU text PRIMARY KEY,
Nombre_Producto text,
Modelo text,
Color text,
Tamano_Producto int,
Estilo text,
Costo numeric(12,2),
Precio numeric(12,2),
Subcategoria text,
Categoria text);

CREATE TABLE Tienda
(Nombre_Tienda text PRIMARY KEY,
Region text,
Zona text,
Pais text
);

CREATE TABLE Ventas (
    Fecha_Orden date,	
    Numero_de_Orden text,	
    Unidades_Vendidas int,	
    Monto_Venta numeric(12,2),	
    Nombre_Tienda text REFERENCES Tienda(Nombre_Tienda),
    SKU_Producto text REFERENCES Productos(SKU),
    IdCliente text REFERENCES Clientes(IdCliente)
);

/* ===============================================
        Consulta de interes
        Guardado como: datos_cliente_ventas.csv
   =============================================== */



SELECT
    c.IdCliente AS cliente,
    c.Genero,
    c.nivel_educativo,
    c.Ocupacion,
    c.propietario_casa,
    c.estado_civil,
    c.ingreso_anual,
    c.numero_hijos,
    SUM(v.unidades_vendidas) AS unidades_compradas
FROM Ventas v 
JOIN Clientes c ON v.IdCliente = c.IdCliente
GROUP BY
    c.IdCliente,
    c.Genero,
    c.nivel_educativo,
    c.Ocupacion,
    c.propietario_casa,
    c.estado_civil,
    c.ingreso_anual,
    c.numero_hijos
ORDER BY 
    unidades_compradas DESC,
	cliente ASC;
