

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

**Estado actual:**
El dashboard se encuentra en **fase de desarrollo**.
Actualmente se están incorporando:

* Visualizaciones más intuitivas y amigables con el usuario.
* Análisis de ventas mensuales.
* Modelos predictivos ARIMA para estimar ventas futuras.



![Avance del Dashboard](assets/PreDash.png)




## Métricas de Comportamiento de Clientes

Algunas métricas clave que se están desarrollando en este proyecto son:

* **Clientes Recurrentes:**
  Clientes que compran de forma constante dentro de un periodo definido.
  *Pendiente definir el número mínimo de compras y el intervalo temporal.*

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

1. Finalizar el dashboard en Power BI con visualizaciones dinámicas.
2. Definir intervalos de tiempo y umbrales para clientes recurrentes y perdidos.
3. Entrenar y evaluar el modelo **ARIMA** para pronóstico de ventas.
4. Publicar versión final del dashboard y documentación técnica del modelo predictivo.


## Autor

**Ernesto F.**


> **Proyecto en desarrollo – 2025**
> *Analista de Datos Jr. | Trainee en Data Science | Enfocado en el análisis, modelado y visualización de datos para la toma de decisiones, aplicando técnicas de Análisis de Datos, Machine Learning y Modelos Predictivos.*

