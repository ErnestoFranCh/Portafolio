# User Activity Analysis Project – *Educational App*

## General Description

This project aims to **analyze the monthly behavior of users** in an **educational application**, covering the period of **January 2024**.
The main objective was to **understand usage patterns**, **compare activity between Premium and Free users**, and **segment users according to their activity level** using a **K-Means** model developed in Python.

The study provides valuable insights for **retention**, **engagement**, and **content personalization** strategies—key elements in digital education platforms.

---

## Python Analysis

The analysis was conducted in a **Python (Jupyter Notebook)** environment, following these main stages:

1. **Data cleaning and validation**

2. **Daily and monthly exploratory analysis**

3. **User streak calculation**

4. **Comparison of Premium vs Free users**

   * The **Mann–Whitney U test** was applied, identifying statistically significant differences (p < 0.001) with a **strong effect size (r ≈ 0.8)**.
   * Premium users showed higher engagement and interaction levels.

5. **User Segmentation with K-Means**

   * Numerical variables were standardized, and the optimal number of clusters (**K = 3**) was determined.
   * Three user segments were identified:

| Segment       | Description                  | Average Activity                                      |
| ------------- | ---------------------------- | ----------------------------------------------------- |
| **Low**       | Users with low interaction   | 19 lessons, 6 h of study, 9 quizzes, 19 active days   |
| **Moderate**  | Regular and consistent users | 23 lessons, 7 h of study, 12 quizzes, 23 active days  |
| **Intensive** | Highly engaged users         | 42 lessons, 16 h of study, 31 quizzes, 22 active days |

📁 The analysis and modeling files can be found in:
[`python\ModeloKmeans.ipynb`](python/ModeloKmeans.ipynb)

---

## Power BI Dashboard

An **interactive dashboard** was developed in Power BI to visualize the analysis results and user segmentation.
It allows users to explore key behavioral metrics, including:

* **Average quizzes per user**
* **Quizzes per hour of app usage**
* **Lessons completed per hour**
* **Distribution by subscription type and cluster**

**📊 Interactive Dashboard:**
[View Dashboard Online](https://mavenshowcase.com/project/52138)

---

## Project Structure

```
ActUsuarios_KMeans/
│
├── python/
│   ├── ModeloKmeans.ipynb                              # Main analysis notebook
│   ├── kmeans_segmentacion_estudiantes_2025-21-10.pkl  # Trained K-Means model
│   └── scaler_metricas_actividad_estudiantes_2025-21-10.pkl  # Scaler (StandardScaler)
│
└── tablas/
    ├── user_activity.csv                      # Source dataset
    └── resumen_actividad_usuario_mensual.csv  # Final dataset with user clusters
```

---

## Technologies Used

* **Python** – Data cleaning, analysis, and modeling
* **pandas**, **numpy**, **seaborn**, **matplotlib** – Exploratory analysis and visualization
* **scikit-learn** – K-Means modeling and segmentation
* **scipy.stats** – Non-parametric statistical testing
* **Power BI** – Data visualization and user interaction
* **Power Query** – Data transformation and modeling for the dashboard

---

## Author

**Ernesto F.**

> **Project in progress – 2025**
> *Junior Data Analyst | Data Science Trainee | Focused on data analysis, modeling, and visualization for decision-making, applying techniques in Data Analytics, Machine Learning, and Predictive Modeling.*
