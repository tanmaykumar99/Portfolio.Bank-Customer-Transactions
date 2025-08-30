# Business Requirement Document  
## Bank Customer Transaction Analysis  

---

## 1. Introduction  
This document outlines the business requirements for a bank’s customer base and their respective transactions, in order to analyse bank customer transaction data from **August 1, 2016, to October 21, 2016**.  

The primary goal is to derive actionable insights into customer behaviour, identify opportunities for business growth, and mitigate risks associated with fraudulent activities. This analysis will serve as the foundation for developing data-driven strategies for marketing, customer relationship management, and risk management.  

---

## 2. Business Objectives  
- **Enhance Customer Understanding**: Develop a 360-degree view of our customers by analysing their demographic and transactional data.  
- **Optimise Marketing Strategies**: Identify key customer segments to tailor marketing campaigns and product offerings, thereby increasing customer engagement and profitability.  
- **Improve Customer Retention**: Understand the spending patterns and preferences of high-value customers to develop targeted retention strategies.  
- **Mitigate Financial Risk**: Proactively identify and flag potentially fraudulent or anomalous transactions to minimize financial losses.  
- **Drive Revenue Growth**: Identify cross-selling and up-selling opportunities based on customer transaction behavior and account balances.  

---

## 3. Project Scope  

### In-Scope  
- Data preprocessing and cleaning of the bank customer transaction dataset.  
- Exploratory Data Analysis (EDA) to understand customer demographics and spending patterns.  
- Customer segmentation based on transactional behavior (e.g., RFM analysis).  
- Time series analysis of transaction volumes and amounts.  
- Development of a risk analysis model to detect anomalous transactions.  
- Creation of a Power BI dashboard for visualising the key findings.  

### Out-of-Scope  
- Real-time transaction monitoring and fraud detection.  
- Implementation of any marketing or risk mitigation strategies.  
- Analysis of data outside the specified timeframe (**August 1, 2016 – October 21, 2016**).
- Analysis of data between **October 1, 2016 - October 15, 2016** & **October 17, 2016 - October 21, 2016** due to absence of data.
---

## 4. Business Requirements  

### 4.1 Customer Demographics & Behavior Analysis  
- **BR-01**: What is the demographic profile of our customer base in terms of age, gender, and location?  
- **BR-02**: How does spending behavior differ across different demographic segments (age, gender, location)?  
- **BR-03**: Is there a correlation between a customer's account balance and their transaction amount? Do customers with higher balances make larger or more frequent transactions?  
- **BR-04**: Which geographical locations have the highest concentration of customers and the highest transaction values?  

### 4.2 Customer Segmentation  
- **BR-05**: Can we segment our customers into distinct groups based on their transaction history (e.g., high-value customers, frequent shoppers, at-risk customers)?  
- **BR-06**: What are the key characteristics of each customer segment? How can we leverage this information for targeted marketing?  
- **BR-07**: Who are our most valuable customers (e.g., based on monetary value and frequency)? What strategies can we employ to retain them?  

### 4.3 Time-Based Transaction Analysis  
- **BR-08**: What are the daily, weekly, and monthly trends in transaction volume and value?  
- **BR-09**: How do transaction patterns vary by time of day and day of the week? When are our peak transaction times?  
- **BR-10**: Do public holidays and weekends have a significant impact on transaction activity?  

### 4.4 Risk & Anomaly Detection  
- **BR-11**: Can we develop a system to identify transactions that deviate significantly from a customer's normal spending pattern?  
- **BR-12**: What are the characteristics of potentially anomalous transactions (e.g., unusually high amounts, transactions at odd hours, high frequency in a short period)?  
- **BR-13**: Can we create a risk score for transactions to prioritize investigations?  

---

## 5. Success Criteria  
- Successful segmentation of at least **80%** of the active customer base.  
- Identification of at least **5 distinct, actionable customer segments**.  
- A risk model capable of flagging the **top ~5% of anomalous transactions** with a clear justification.  
- A comprehensive **Power BI dashboard** that provides answers to the key business requirements.  
