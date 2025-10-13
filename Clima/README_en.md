# Temperature Prediction with Machine Learning

This project aims to **predict the temperature in Mexico City** based on meteorological variables (wind speed, atmospheric pressure, visibility, and humidity), using a **Multiple Linear Regression** model.

The workflow was divided into three main stages:

1. **Data Collection (Web Scraping)**

   * Historical weather data was extracted from [timeanddate.com](https://www.timeanddate.com/weather/mexico/mexico-city/historic).
   * `Selenium` and `BeautifulSoup` were used to automate the daily download of weather tables.
   * An automatic backup system was implemented every 10 iterations to prevent data loss in case of errors.

2. **Data Cleaning and Transformation**

   * Measurement units were normalized:

     * Fahrenheit → Celsius  
     * mph → km/h  
     * inHg → hPa  
     * miles → km  
   * Redundant columns were removed and variables were standardized.  
   * The cleaned dataset was exported as `cleaned_weather_data.xlsx`.

3. **Modeling and Evaluation**

   * A **Linear Regression** model was trained with cross-validation.  
   * Predictor variables were standardized using `StandardScaler`.  
   * Key metrics on the test set:

     * **MAE:** ~1.5 °C  
     * **RMSE:** ~1.95 °C  
     * **R²:** ~0.73 (the model explains 73% of the temperature variability)  
   * The model was verified to meet the **homoscedasticity** assumption of residuals.

---

## Project Structure

```
┣ clima-machine-learning
  ┣ 01_webscraping.ipynb          # Weather data collection 
  ┣ 02_data_cleaning.ipynb        # Data cleaning and transformation 
  ┣ 03_model_training.ipynb       # Modeling, cross-validation, and evaluation 
  ┣ 04_Predictions.ipynb          # Model tested with new input 
  ┣ scaler.pkl                    # Saved scaler for preprocessing replication 
  ┣ temperature_model.pkl         # Saved model for prediction replication 
  ┣ cleaned_weather_data.xlsx     # Clean dataset ready for modeling 
  
┗ README_en.md                     # Project documentation
```


---

## Results

* The model shows **strong predictive performance**, with average errors below 2 °C.  
* Cross-validation indicates the model is **stable and generalizable**.  
* Residuals meet the assumptions of linear regression, confirming the model’s statistical validity.

**Conclusion:**  
The model is optimal for this dataset and can serve as a foundation for temperature prediction systems for exploratory or educational purposes.

---

## Technologies Used

* **Python 3.11**
* Main libraries:

  * `Selenium`, `BeautifulSoup` → Web Scraping  
  * `Pandas`, `NumPy` → Data cleaning and manipulation  
  * `Scikit-learn` → Modeling, validation, and metrics  
  * `Matplotlib`, `Seaborn` → Visualization

---

**Author:** Ernesto F.
