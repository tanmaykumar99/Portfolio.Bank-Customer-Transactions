SELECT *
FROM Banking.customers;

![Customers](../images/customers.png)

SELECT *
FROM Banking.transactions;

![Transactions](../images/txns.png)

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

![Duplicate Check](../images/dup_check.png)    
    
SELECT *
FROM bank_customer_transactions_dedup;

![Joined Table](../images/joined.png)

SELECT CASE
            WHEN (SELECT COUNT(*) FROM transactions) =
                 (SELECT COUNT(*) FROM bank_customer_transactions_dedup)
           THEN 'JOIN SUCCESSFUL'
           ELSE 'JOIN FAILED'
       END AS Result;

![Result](../images/result.png)