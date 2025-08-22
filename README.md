# Bank Customer Transaction Analysis & Insights Dashboard

## 1. Project Overview

This project presents a comprehensive analysis of over 10M+ bank customer transaction data from the third quarter of 2016. It showcases an end-to-end data analytics workflow, from data ingestion and preprocessing to advanced analysis and an interactive dashboard. The primary goal is to translate raw transactional data into strategic business intelligence, focusing on customer segmentation, behavioral patterns, and risk mitigation.

The analysis is structured into a four-part Python pipeline, and the final insights are presented in an executive-ready Power BI dashboard. This project demonstrates proficiency in data manipulation, statistical analysis, machine learning (unsupervised), and data visualization, all framed within a business-centric context relevant to the financial services industry.

*   **Technologies Used:** SQL, Python (Pandas, Matplotlib, Seaborn, Scikit-learn, optional geocoding), Power BI
*   **Analytical Concepts:** RFM Segmentation, Isolation Forest
*   **Time Frame of Data:** August 1, 2016 – October 21, 2016

## 2. Business Problem & Objectives

In a competitive financial landscape, understanding customer behavior is vital for driving growth and managing risk. This project addresses the need for a data-driven approach to solve key business challenges. The following table outlines the project's objectives and how success is measured:

| Business Objective | Key Business Questions Addressed | Success Metrics |
| :--- | :--- | :--- |
| **Profile High-Value Customers** | - What are the demographic characteristics of our highest-spending customers? <br>- How does spending behavior correlate with account balance? | Identification of the top 3 customer personas to inform tailored product offerings. |
| **Enhance Customer Segmentation** | - Who are our "Champion" customers, and what defines their behavior? <br>- Which customers are "At-Risk" of churning? <br>- How can we design targeted campaigns for different RFM segments? | - A measurable lift in engagement from campaigns targeting "At-Risk" and "Potential Loyalist" segments. |
| **Mitigate Transactional Fraud** | - What are the defining features of anomalous transactions (time, amount, location, frequency)? <br>- Can we develop a risk score for transactions based on deviations from normal behavior? | - A data-backed profile of a high-risk transaction to inform fraud monitoring systems. <br>- A 5% reduction in potentially fraudulent transaction volume. |
| **Optimize Operational Timing** | - How do transaction volumes fluctuate on weekdays, weekends, and public holidays? <br>- What are the peak transaction times during the day? | - A 5% increase in promotional campaign click-through rates by aligning send times with peak customer activity. |

## 3. Data Source & ETL Pipeline

The foundational data for this project originates from a relational database (SQL) and is comprised of two primary tables:

1.  **`customer_details`**: Contains demographic information for each customer (e.g., `CustomerID`, `DOB`, `Gender`, `Location`).
2.  **`transaction_details`**: Contains records for each individual transaction (e.g., `TransactionID`, `CustomerID`, `TransactionAmount`, `Date`, `Time`).

An initial SQL `JOIN` operation was performed on `CustomerID` to create a unified, denormalized dataset. This integrated dataset was then imported into a Python environment using a data pipeline script (`Data_Preprocessing.ipynb`), which handled the database connection and data loading into a Pandas DataFrame.

## 4. Analytical Workflow & Methodology

The analysis is performed through a sequence of four Jupyter Notebooks, each serving a distinct purpose in the data-to-insights pipeline.

### Analytical Modules

1.  **`Data_Preprocessing.ipynb`**
    *   **Objective:** To clean and prepare the raw data for analysis.
    *   **Methodology:**
        *   Established a connection to the SQL database to import the transaction dataset.
        *   Performed data type corrections (e.g., converting date strings to datetime objects).
        *   Engineered new features, including `Age` (from `CustomerDOB`) and `age_group` for cohort analysis.
        *   Filtered out transactions from non-domestic locations to maintain the integrity of the domestic market analysis.
        *   Exported the cleaned dataset to a `.parquet` file for efficient use in subsequent notebooks.

2.  **`EDA.ipynb`**
    *   **Objective:** To uncover initial patterns and insights through exploratory data analysis.
    *   **Methodology:**
        *   **Univariate Analysis:** Visualized the distribution of customers by gender, location, and age group to understand the demographic composition of the customer base.
        *   **Bivariate Analysis:** Investigated relationships between spending patterns and demographics. Analyzed how average transaction amounts differ across genders, age groups, and the top 10 locations.

3.  **`Segmentation_and_Risk_Analysis.ipynb`**
    *   **Objective:** To segment customers based on behavior and identify high-risk transactions.
    *   **Methodology:**
        *   **RFM Customer Segmentation:** Aggregated data to the customer level to compute **Recency**, **Frequency**, and **Monetary** values. Customers were then scored and categorized into actionable segments like *Champions*, *Loyal Customers*, *At-Risk*, and *Hibernating*.
        *   **Anomaly Detection:** Engineered risk-focused features such as `AmountZScoreByLocation`, `TimeSinceLastTxn`, `IsWeekend`, `IsHoliday`, and `IsLateNight`. An unsupervised **Isolation Forest** model was trained on these features to flag transactions that deviate from normal patterns.

4.  **`Time_Series.ipynb`**
    *   **Objective:** To analyze the temporal patterns of transaction activity.
    *   **Methodology:**
        *   Analyzed transaction volumes and average transaction amounts across different days of the week and times of the day (e.g., Morning, Afternoon, Evening).
        *   Plotted transaction volume over the entire time series, annotating public holidays to visualize their impact on customer spending.

## 5. Power BI Dashboard Showcase

The findings from the Python analysis were consolidated into an interactive Power BI dashboard designed for business stakeholders. The dashboard consists of five pages:

1.  **Executive KPI Overview:** A high-level summary of key metrics.
2.  **Customer Deep Dive:** An interactive explorer for customer demographics and geography.
3.  **RFM Segmentation & Targeting:** A strategic view for the marketing team to understand and target customer segments.
4.  **Temporal & Anomaly Analysis:** An operational view focusing on transaction timing and risk.
5.  **Data Dictionary & Project Info:** A reference page explaining the metrics and project scope.

**(Note: You can embed a GIF or screenshot of your dashboard here for visual appeal)**

`[Link to your public Power BI Dashboard]`

## 6. How to Run This Project

### Prerequisites
*   Python 3.8+
*   Jupyter Notebook or JupyterLab
*   Power BI Desktop

### Dependencies
All required Python libraries are listed in the `requirements.txt` file. Install them using pip:

```bash
pip install -r requirements.txt

### Setup & Execution
1.  **Database:** Ensure you have a running SQL server with the `customer_details` and `transaction_details` tables. Update the database credentials in `Data_Preprocessing.ipynb`.
2.  **Run the Notebooks Sequentially:** The project notebooks are designed to be run in the following order, as they create data files used by subsequent steps:
    1.  `Data_Preprocessing.ipynb`
    2.  `EDA.ipynb`
    3.  `Segmentation_and_Risk_Analysis.ipynb`
    4.  `Time_Series.ipynb`
3.  **Power BI:** Open the `Bank_Analysis_Dashboard.pbix` file. The dashboard is pre-configured to use the `.parquet` and `.csv` files generated by the Python scripts. Refresh the data sources if you re-run the notebooks.

## 7. Future Work

*   **Predictive Modeling:** With labeled fraud data, a supervised classification model (e.g., XGBoost, Logistic Regression) could be built to create a more accurate fraud detection system, and subsequently tested on data from 2024 or '25.
*   **Time Series Forecasting:** Develop a forecasting model (e.g., SARIMA, Prophet) to predict transaction volumes for the upcoming quarter, aiding in resource planning.
*   **Product Recommendation Engine:** Obtain data with transaction contents, extend the existing python scripts to said data, and build a system that recommends cross-sell and up-sell opportunities to customers.