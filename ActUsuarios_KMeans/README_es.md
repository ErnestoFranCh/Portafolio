# Proyecto de Análisis de Actividad de Usuarios en App Educativa

## Descripción General

Este proyecto tiene como objetivo **analizar el comportamiento mensual de los usuarios** en una **aplicación educativa**, correspondiente al mes de **enero de 2024**.
El propósito principal fue **comprender los patrones de uso**, **comparar la actividad entre usuarios Premium y Gratuitos**, y **segmentar a los usuarios según su nivel de actividad** utilizando un modelo de **K-Means** desarrollado en Python.

Este estudio busca aportar información relevante para estrategias de **retención, engagement** y **personalización de contenidos**, fundamentales en productos digitales educativos.

---

## Análisis en Python

El análisis se llevó a cabo en un entorno **Python (Jupyter Notebook)**, donde se realizaron las siguientes etapas:

1. **Limpieza y validación de datos**

2. **Análisis exploratorio diario y mensual**

3. **Cálculo de rachas de uso**

4. **Comparación de usuarios Premium vs Gratuitos**

   * Se aplicó la prueba **Mann–Whitney U**, identificando diferencias estadísticamente significativas (p < 0.001) y un **tamaño del efecto alto (r ≈ 0.8)**.
   * Los usuarios Premium mostraron una mayor participación e interacción.

5. **Modelo de Segmentación con K-Means**

   * Se estandarizaron las variables numéricas y se determinó un número óptimo de clusters (**K = 3**).
   * Se identificaron tres segmentos de usuarios:

| Segmento      | Descripción                      | Actividad promedio                                         |
| ------------- | -------------------------------- | ---------------------------------------------------------- |
| **Bajo**      | Usuarios con baja interacción    | 19 lecciones, 6 h de estudio, 9 quizzes, 19 días activos   |
| **Moderado**  | Usuarios regulares y constantes  | 23 lecciones, 7 h de estudio, 12 quizzes, 23 días activos  |
| **Intensivo** | Usuarios altamente comprometidos | 42 lecciones, 16 h de estudio, 31 quizzes, 22 días activos |

📁 Los archivos de análisis y modelado se encuentran en la carpeta:
[`python\ModeloKmeans.ipynb`](python/ModeloKmeans.ipynb)

---

## Dashboard en Power BI

Se desarrolló un **dashboard interactivo** en Power BI para visualizar los resultados del análisis y la segmentación de usuarios.
El tablero permite explorar indicadores clave de comportamiento, incluyendo:

* **Promedio de quizzes por usuario**
* **Quizzes por hora de uso**
* **Lecciones completadas por hora**
* **Distribución por tipo de suscripción y cluster**

**📊 Dashboard Interactivo:**
[Ver Dashboard en línea](https://mavenshowcase.com/project/52138)

---

## Estructura del Proyecto

```
ActUsuarios_KMeans/
│
├── python/
│   ├── ModeloKmeans.ipynb                              # Notebook 
│   ├── kmeans_segmentacion_estudiantes_2025-21-10.pkl  # Modelo K-Means entrenado
│   └── scaler_metricas_actividad_estudiantes_2025-21-10.pkl  # Escalador (StandardScaler)
│
└── tablas/
    ├── user_activity.csv                      # Base de datos fuente
    └── resumen_actividad_usuario_mensual.csv  # Base final con clusters por usuario
```

---

## Tecnologías Utilizadas

* **Python** – Limpieza, análisis y modelado de datos
* **pandas**, **numpy**, **seaborn**, **matplotlib** – Análisis exploratorio y visualización
* **scikit-learn** – Modelado y segmentación con K-Means
* **scipy.stats** – Pruebas estadísticas no paramétricas
* **Power BI** – Visualización e interacción con resultados
* **Power Query** – Transformación y modelado de datos para el dashboard

---

## Autor

**Ernesto F.**

> **Proyecto en desarrollo – 2025**
> *Analista de Datos Jr. | Trainee en Data Science | Enfocado en el análisis, modelado y visualización de datos para la toma de decisiones, aplicando técnicas de Análisis de Datos, Machine Learning y Modelos Predictivos.*

