# SQL Data Deduplication and Integration Script

## 1. Overview

This SQL script is the foundational first step in the bank customer transaction analysis project. Its primary purpose is to prepare the raw data by handling potential duplicates in the customer records and then integrating the customer demographic data with their corresponding transaction records.

The output of this script is a clean, denormalized table named `bank_customer_transactions_dedup`, which serves as the single source of data for the subsequent Python analysis pipeline.

## 2. Business Justification

Data integrity is crucial for any reliable analysis. In a transactional system, it's possible for customer records to have duplicates due to data entry errors, system integration issues, or simply due to lack of unique indexing, as is the case here. Performing an analysis on data with duplicate customer profiles would lead to skewed and inaccurate results, particularly at the customer-level aggregations like RFM segmentation. This script mitigates that risk by programmatically identifying and removing duplicate customer entries before performing the final data integration.

## 3. Script Workflow

The script executes a series of logical steps to achieve its goal:

### Step 1: Initial Data Exploration
The script begins with simple `SELECT *` statements to allow the user to inspect the raw `customers` and `transactions` tables.


### Step 2: Duplicate Identification
A Common Table Expression (CTE) named `duplicate_cte` is used in conjunction with the `ROW_NUMBER()` window function. It partitions the data by `CustomerID` and assigns a row number to each entry. Any `CustomerID` with a `row_num1` greater than 1 is identified as a duplicate.


### Step 3: Customer Deduplication
A new, permanent table named `customers_dedup` is created. This table contains only the unique customer records by selecting only the rows where the row number is 1 for each `CustomerID` partition.


### Step 4: Data Integration (Join Operation)
The deduplicated customer table (`customers_dedup`) is joined with the `transactions` table on the `CustomerID` foreign key. This creates the final master table, `bank_customer_transactions_dedup`, which populates each transaction with the corresponding customer's demographic data.


### Step 5: Validation Check
As a final quality assurance step, the script compares the row count of the original `transactions` table with the final `bank_customer_transactions_dedup` table. If the counts match, it confirms that the join operation was successful and no transaction records were lost in the process.


## 4. How to Use

This script is designed to be run on a SQL server (e.g., MySQL, PostgreSQL) that contains the `Banking` database with the `customers` and `transactions` tables. Execute the script from top to bottom in a SQL client or terminal. The final output table, `bank_customer_transactions_dedup`, will be ready for connection and ingestion by the Python pipeline.

Note: The datasets can be imported as a csv file into an SQL database using the Table Import Data Wizard feature.