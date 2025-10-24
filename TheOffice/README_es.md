

# Proyecto de Análisis y Modelado de Ventas: *North America Retail Supply Chain Sales*

## Descripción General

Este proyecto tiene como objetivo construir un **modelo de datos** a partir de una base de datos de ventas minoristas en Norteamérica, integrando herramientas de **Python**, **PostgreSQL** y **Power BI**.

El trabajo combina **modelado de datos, análisis de comportamiento de clientes y modelado predictivo**, orientado a la toma de decisiones comerciales basadas en datos.



## Fuente de Datos

**Base de datos:** `north-america-retail-supply-chain-sales`
La fuente contiene información transaccional de ventas, clientes, productos, regiones y vendedores.

A partir de esta base, se generó un modelo analítico en **Python** dentro del notebook:
`Modelo_datos_python.ipynb`

## Modelado de Datos

Desde la tabla de ventas general, se diseñó un **modelo relacional estrella (Star Schema)** compuesto por:

### Tablas de Dimensión

* **Calendario** – Estructura temporal de fechas.
* **DimCustomers** – Información de clientes.
* **DimProducts** – Catálogo de productos.
* **DimRegion** – Regiones geográficas de venta.
* **DimSegment** – Segmentos de negocio.
* **DimSellers** – Información de vendedores.
* **DimShip** – Métodos y tipos de envío.

### Tablas de Hechos

* **FactSales** – Transacciones de venta con métricas cuantitativas.
* **FactTransaction** – Registro detallado de operaciones individuales.

Todas las tablas fueron generadas y almacenadas en la carpeta:
📁 `Bases_Datos/`


## Dashboard en Power BI

Los datos modelados fueron importados a **Power BI** para la creación de un **dashboard interactivo de ventas**.

El tablero busca analizar:

* Ventas anuales de los trabajadores.
* Comportamiento de clientes a lo largo del tiempo.
* Métricas de retención y pérdida de clientes.
* Preparación para un modelo de pronóstico de ventas (ARIMA).

![Avance del Dashboard](assets/finish.png)

Ver Dashboard: [Click aqui](https://mavenshowcase.com/project/52157)

## Métricas de Comportamiento de Clientes

Algunas métricas clave que se desarrollaron son:

* **Clientes Recurrentes:**
  Se identifican como aquellos clientes que realizan compras de manera constante dentro de un periodo determinado.
  El procedimiento utilizado para calcular este intervalo se encuentra documentado en [`SQL/AnalisisComportamientoClientes.sql`](SQL/AnalisisComportamientoClientes.sql).
  A partir del **análisis de cuartiles**, se determinó que los clientes que **efectúan al menos tres compras en un lapso de seis meses** pueden ser clasificados como **clientes recurrentes**.

* **Clientes Perdidos:**
  Clientes que han dejado de comprar después de cierto periodo sin actividad.

* **Churn Rate:**
  Porcentaje de clientes perdidos respecto al total de clientes en un periodo determinado.

Estas métricas están siendo desarrolladas en **PostgreSQL**, dentro del archivo:
`AnalisisComportamientoClientes.sql`
El modelo de datos para la base de datos PostgreSQL se define en:
`Tables.sql`

Ubicación:
📁 `SQL/`


## Pronóstico de Ventas (ARIMA)

En paralelo, se están trabajando las **ventas mensuales** con el objetivo de generar un **modelo ARIMA** para estimar la evolución de ventas futuras.

Los datos utilizados se encuentran en la carpeta:
📁 `Ventas_por_mes/`



## Tecnologías Utilizadas

* **Lenguaje:** Python 3.11
* **Bases de datos:** PostgreSQL
* **Visualización:** Power BI
* **Librerías Python:**

  * `pandas`, `numpy` → Manipulación y limpieza de datos.
  * `pmdarima` → Modelado ARIMA (pronóstico).


## Próximos Pasos

1. Entrenar y evaluar el modelo **ARIMA** para pronóstico de ventas.


## Autor

**Ernesto F.**


> **Proyecto en desarrollo – 2025**
> *Analista de Datos Jr. | Trainee en Data Science | Enfocado en el análisis, modelado y visualización de datos para la toma de decisiones, aplicando técnicas de Análisis de Datos, Machine Learning y Modelos Predictivos.*

