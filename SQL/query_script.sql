SELECT *
FROM Banking.customers;

SELECT *
FROM Banking.transactions;

## Due to same customer making multiple transactions, there can be duplicates while joining the two
# tables. Checking for duplicates first using window function and row number. 
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY CustomerID) AS row_num1
FROM customers
)
SELECT *
FROM duplicate_cte
WHERE row_num1>1;

## Only keep the original CustomerID, discard duplicates
CREATE TABLE customers_dedup AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY CustomerID) AS row_num2
    FROM customers
) t
WHERE row_num2 = 1;

## Joining transactions table to customers table, Foreign Key: transactions.CustomerID
CREATE TABLE bank_customer_transactions_dedup AS
SELECT 
    t.TransactionID,
    t.CustomerID,
    c.CustomerDOB,
    c.CustGender,
    c.CustLocation,
    c.CustAccountBalance,
    t.TransactionDate,
    t.TransactionTime,
    t.`TransactionAmount (INR)`
FROM transactions t
JOIN customers_dedup c
    ON t.CustomerID = c.CustomerID;
    
    
SELECT *
FROM bank_customer_transactions_dedup;

SELECT CASE
            WHEN (SELECT COUNT(*) FROM transactions) =
                 (SELECT COUNT(*) FROM bank_customer_transactions_dedup)
           THEN 'JOIN SUCCESSFUL'
           ELSE 'JOIN FAILED'
       END AS Result;
