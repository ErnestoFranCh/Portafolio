# Predicción de Temperatura con Machine Learning

Este proyecto tiene como objetivo **predecir la temperatura en Ciudad de México** a partir de variables meteorológicas (velocidad del viento, presión atmosférica, visibilidad y humedad), utilizando un modelo de **Regresión Lineal Múltiple**.

El flujo de trabajo se dividió en tres etapas principales:

1. **Obtención de datos (Web Scraping)**

   * Se extrajo información histórica del clima desde el portal [timeanddate.com](https://www.timeanddate.com/weather/mexico/mexico-city/historic).
   * Se utilizó `Selenium` y `BeautifulSoup` para automatizar la descarga de tablas climáticas día por día.
   * Se implementó un sistema de respaldo automático cada 10 iteraciones para evitar pérdida de información en caso de error.

2. **Limpieza y Transformación de Datos**

   * Se normalizaron unidades de medida:

     * Fahrenheit → Celsius.
     * mph → km/h.
     * inHg → hPa.
     * millas → km.
   * Se eliminaron columnas redundantes y se estandarizaron variables.
   * El dataset limpio se exportó como `cleaned_weather_data.xlsx`.

3. **Modelado y Evaluación**

   * Se entrenó un modelo de **Regresión Lineal** con validación cruzada.
   * Se estandarizaron las variables predictoras con `StandardScaler`.
   * Métricas principales en el conjunto de prueba:

     * **MAE:** ~1.5 °C
     * **RMSE:** ~1.95 °C
     * **R²:** ~0.73 (el modelo explica el 73% de la variabilidad de la temperatura).
   * Se verificó que el modelo cumple con la **homocedasticidad** de los residuos.

---

## Estructura del proyecto

```
 PrediccionTemperatura
 ┣  01_webscraping.ipynb         # Obtención de datos climáticos
 ┣  02_data_cleaning.ipynb       # Limpieza y transformación de datos
 ┣  03_model_training.ipynb      # Modelado, validación cruzada y evaluación
 ┣  04_Predicciones.ipynb        # Se prueba el modelo con un dato nuevo.
 ┣  scaler.pkl                   # Escalador guardado para replicar el preprocesamiento
 ┣  modelo_temperatura.pkl       # Modelo guardado para replicar el preprocesamiento
 ┣  cleaned_weather_data.xlsx    # Dataset limpio listo para modelar
 ┗  README.md                    # Documentación del proyecto
```

---

## Resultados

* El modelo muestra **buen desempeño predictivo**, con errores promedio menores a 2 °C.
* La validación cruzada indica que el modelo es **estable y generalizable**.
* Los residuos cumplen los supuestos de la regresión lineal, confirmando la validez estadística del modelo.

**Conclusión:**
El modelo es óptimo para este dataset y se puede usar como base para sistemas de predicción de temperatura con fines exploratorios o educativos.

---

## Tecnologías utilizadas

* **Python 3.11**
* Librerías principales:

  * `Selenium`, `BeautifulSoup` → Web Scraping.
  * `Pandas`, `NumPy` → Limpieza y manipulación de datos.
  * `Scikit-learn` → Modelado, validación y métricas.
  * `Matplotlib`, `Seaborn` → Visualización.

---

**Autor:** Ernesto F.

---
