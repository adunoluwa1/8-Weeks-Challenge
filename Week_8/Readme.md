# 8-Week SQL Challenge 
# Cast Study #4 - Data Bank

[```Home```](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge) [```🌐 Case Study #4 - Data Bank```](https://8weeksqlchallenge.com/case-study-4/)

![image](https://user-images.githubusercontent.com/99233674/199316543-cf2f606a-18c1-48f1-b10a-e2df8a1c3772.png)

# 📕 Table of Contents
- [🛠️ Background Statement](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_5#%EF%B8%8F-background-statement)
- [📂 Dataset](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_5#-dataset)
- [✒️ Case Study Questions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_5#%EF%B8%8F-case-study-questions)
- [🏆 Solutions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_5#-solutions)

# 🛠️ Background Statement
> There is a new innovation in the financial industry called Neo-Banks: new aged digital only banks without physical branches.

> Danny thought that there should be some sort of intersection between these new age banks, cryptocurrency and the data world…so he decides to launch a new initiative - Data Bank!

> Data Bank runs just like any other digital bank - but it isn’t only for banking activities, they also have the world’s most secure distributed data storage platform!

> Customers are allocated cloud data storage limits which are directly linked to how much money they have in their accounts. There are a few interesting caveats that go with this business model, and this is where the Data Bank team need your help!

> The management team at Data Bank want to increase their total customer base - but also need some help tracking just how much data storage their customers will need.

>  This case study is all about calculating metrics, growth and helping the business analyse their data in a smart way to better forecast and plan for their future developments!


# 📂 Dataset
For this case study there is only a single table: weekly_sales

<details><summary>View Datasets</summary>
  <p>

- Regions
    
  Just like popular cryptocurrency platforms - Data Bank is also run off a network of nodes where both money and data is stored across the globe. In a traditional banking sense - you can think of these nodes as bank branches or stores that exist around the world.
  This regions table contains the region_id and their respective region_name values  
  
  <details><summary>View table</summary>
    <p>
  
    |region_id|	region_name|
    |---------|------------|
    |1	      |Africa      |
    |2	      |America     |
    |3        |Asia        |
    |4        |Europe      |
    |5        |Oceania     |
      
    </p>
  </details>

- Customer Nodes
    
  Customers are randomly distributed across the nodes according to their region - this also specifies exactly which node contains both their cash and data.

  This random distribution changes frequently to reduce the risk of hackers getting into Data Bank’s system and stealing customer’s money and data!

  Below is a sample of the top 10 rows of the data_bank.customer_nodes
  
  <details><summary>View table</summary>
    <p>
  
    |customer_id|	region_id  |node_id     | start_date | end_date   |
    |---------  |------------|------------|------------|------------|
    |1	        |3           |4           | 2020-01-02 | 2020-01-03 |
    |2	        |3           |5           | 2020-01-03 | 2020-01-17 |
    |3          |5           |4           | 2020-01-27 | 2020-01-18 |
    |4          |5           |4           | 2020-01-07 | 2020-01-19 |
    |5          |3           |3           | 2020-01-15 | 2020-01-23 |
    |6          |1           |1           | 2020-01-11 | 2020-01-06 |
    |7          |2           |5           | 2020-01-20 | 2020-01-04 |
    |8          |1           |2           | 2020-01-15 | 2020-01-28 |
    |9          |4           |5           | 2020-01-21 | 2020-01-25 |
    |10         |3           |4           | 2020-01-13 | 2020-01-14 |
     
    </p>
  </details>

- Customer Transactions
    
  This table stores all customer deposits, withdrawals and purchases made using their Data Bank debit card. 
  
  <details><summary>View table</summary>
    <p>
  
    |customer_id| txn_date    |	txn_type |	txn_amount  |
    |-----------|-------------|----------|--------------|  
    |429        |	2020-01-21  |	deposit  |	82          |
    |155        |	2020-01-10  |	deposit  |	712         |
    |398        |	2020-01-01  |	deposit  |	196         |
    |255        |	2020-01-14  |	deposit  |	563         |
    |185        |	2020-01-29  |	deposit  |	626         |
    |309        |	2020-01-13  |	deposit  |	995         |
    |312        |	2020-01-20  |	deposit  |	485         |
    |376        |	2020-01-03  |	deposit  |	706         |
    |188        |	2020-01-13  |	deposit  |	601         |
    |138        |	2020-01-11  |	deposit  |	520         |
      
    </p>
  </details>
  </p>
</details>
  
  
# ✒️ Case Study Questions
The following case study questions include some general data exploration analysis for the nodes and transactions before diving right into the core business questions and finishes with a challenging final request!

## A. Customer Nodes Exploration
   
   1. How many unique nodes are there on the Data Bank system?
   2. What is the number of nodes per region?
   3. How many customers are allocated to each region?
   4. How many days on average are customers reallocated to a different node?
   5. What is the median, 80th and 95th percentile for this same reallocation days metric for each region?

## B. Customer Transactions

   1. What is the unique count and total amount for each transaction type?
   2. What is the average total historical deposit counts and amounts for all customers?
   3. For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?
   4. What is the closing balance for each customer at the end of the month?
   5. What is the percentage of customers who increase their closing balance by more than 5%?
   
## C. Data Allocation Challenge
   
   To test out a few different hypotheses - the Data Bank team wants to run an experiment where different groups of customers would be allocated data using 3 different options:

   - Option 1: data is allocated based off the amount of money at the end of the previous mont
   - Option 2: data is allocated on the average amount of money kept in the account in the previous 30 days
   - Option 3: data is updated real-time
   
   For this multi-part challenge question - you have been requested to generate the following data elements to help the Data Bank team estimate how much data will need to be provisioned for each option:
   - running customer balance column that includes the impact each transaction
   - customer balance at the end of each month
   - minimum, average and maximum values of the running balance for each customer
   
   Using all of the data available - how much data would have been required for each option on a monthly basis?

## D. Extra Challenge
  > Data Bank wants to try another option which is a bit more difficult to implement - they want to calculate data growth using an interest calculation, just like in a traditional savings account you might have with a bank.
  
  > If the annual interest rate is set at 6% and the Data Bank team wants to reward its customers by increasing their data allocation based off the interest calculated on a daily basis at the end of each day, how much data would be required for this option on a monthly basis?
  
  > Special notes:
  
  > - Data Bank wants an initial calculation which does not allow for compounding interest, however they may also be interested in a daily compounding interest calculation so you can try to perform this calculation if you have the stamina!
  
## Bonus Questions

  > Which areas of the business have the highest negative impact in sales metrics performance in 2020 for the 12 week before and after period?
    - region
    - platform
    - age_band
    - demographic
    - customer_type


# 🏆 Solutions
  <details><summary>View solution</summary>
  <p>
  
## A. Customer Nodes Exploration
   
   1. How many unique nodes are there on the Data Bank system?
   
```sql
        SELECT COUNT(DISTINCT node_id) AS Nodes
        FROM customer_nodes
```
   2. What is the number of nodes per region?
   
```sql
        -- Using Group By
            SELECT region_name, COUNT(node_id) AS #Nodes
            FROM customer_nodes c
            LEFT JOIN regions r
            ON c.region_id = r.region_id
            GROUP BY region_name
            ORDER BY region_name

        -- Using Window Functions
            SELECT DISTINCT region_name,
                   COUNT(node_id) OVER(PARTITION BY c.region_id) AS #Nodes
            FROM customer_nodes c
            LEFT JOIN regions r
            ON c.region_id = r.region_id
            ORDER BY region_name

        -- Using correlated subqueries
            SELECT region_name, (SELECT COUNT(node_id)
                                 FROM customer_nodes c
                                 WHERE r.region_id = c.region_id) AS #Nodes
            FROM regions r
            ORDER BY region_name
```
   3. How many customers are allocated to each region?
   
```sql
        -- Using Group By
            SELECT region_name, COUNT(DISTINCT customer_id) AS #Customers
            FROM customer_nodes c
            LEFT JOIN regions r
            ON c.region_id =r.region_id
            GROUP BY region_name
            ORDER BY region_name
        
        -- Using Window functions
            SELECT DISTINCT region_name, LAST_VALUE(#Customers) OVER(PARTITION BY region_name ORDER BY region_name) AS ##Customers
            FROM
                (SELECT DISTINCT r.region_name, customer_id, DENSE_RANK() OVER(PARTITION BY region_name ORDER BY customer_id) AS #Customers
                FROM customer_nodes c
                LEFT JOIN regions r
                ON c.region_id = r.region_id) sq

        -- Using Correlated subqueries
            SELECT region_name, (SELECT COUNT(DISTINCT customer_id)
                                 FROM customer_nodes c
                                 WHERE r.region_id = c.region_id) AS #Customers
            FROM regions r
```
   4. How many days on average are customers reallocated to a different node?
   
```sql
        -- Using Window functions    
            SELECT AVG(DATEDIFF(D, #prev_date, #start_date)) [Avg Reallocation Time (days)]
            FROM 
                (SELECT customer_id, node_id, #start_date,
                        LAG(#start_date) OVER(PARTITION BY customer_id ORDER BY #start_date) #prev_date
                FROM
                    (SELECT DISTINCT customer_id, node_id, 
                            FIRST_VALUE(start_date) OVER(PARTITION BY customer_id, node_id ORDER BY customer_id, node_id, start_date) #start_date
                    FROM customer_nodes) s) q
            WHERE #prev_date IS NOT NULL

        -- Using correlated subqueries
            -- One method
                SELECT AVG(DATEDIFF(D,prev_date,start_date)) [Avg Reallocation Time (days)]
                FROM
                    (SELECT *,
                    LAG(start_date) OVER(PARTITION BY customer_id ORDER BY start_date) AS prev_date
                    FROM
                        (SELECT DISTINCT customer_id, node_id,
                                (SELECT MIN(start_date)
                                FROM customer_nodes c1
                                WHERE c.customer_id = c1.customer_id
                                AND c.node_id = c1.node_id) AS start_date
                        FROM customer_nodes c) s)q
                WHERE prev_date IS NOT NULL

            -- Another method
                SELECT AVG(DATEDIFF(D,prev_date,start_date)) [Avg Reallocation Time (days)]
                FROM
                    (SELECT customer_id, node_id, start_date, prev_date
                    FROM
                        (SELECT DISTINCT customer_id, node_id, start_date, LAG(start_date) OVER(PARTITION BY customer_id ORDER BY start_date) AS prev_date
                        FROM customer_nodes c
                        WHERE start_date = (SELECT MIN(start_date)
                                            FROM customer_nodes c1
                                            WHERE c.customer_id = c1.customer_id
                                            AND c.node_id = c1.node_id)) s
                    WHERE prev_date IS NOT NULL) sq
```
   5. What is the median, 80th and 95th percentile for this same reallocation days metric for each region?

```sql
        -- Creating View
                -- CREATE OR ALTER VIEW reallocation_days AS (
                --     SELECT DATEDIFF(D,prev_date,start_date) r_time, region_id
                --     FROM
                --         (SELECT *,
                --         LAG(start_date) OVER(PARTITION BY customer_id ORDER BY start_date) AS prev_date
                --         FROM
                --             (SELECT DISTINCT customer_id, node_id, region_id,
                --                     (SELECT MIN(start_date)
                --                     FROM customer_nodes c1
                --                     WHERE c.customer_id = c1.customer_id
                --                     AND c.node_id = c1.node_id) AS start_date
                --             FROM customer_nodes c) s)q
                --     WHERE prev_date IS NOT NULL
                -- )
            --
        -- Median
            SELECT r_time AS Median
            FROM
                (SELECT *, ROW_NUMBER() OVER(ORDER BY r_time) AS Rank
                FROM reallocation_days) sq2
            WHERE rank = (SELECT (COUNT(*) + 1)/2 FROM reallocation_days)

        -- 80th Percentile
            SELECT r_time AS [80th Percentile]
            FROM
                (SELECT *, ROW_NUMBER() OVER(ORDER BY r_time) AS Rank
                FROM reallocation_days) sq2
            WHERE rank = (SELECT CAST((COUNT(*) * 0.8 + 1 ) AS INT) FROM reallocation_days)

        -- 95th Percentile
            SELECT r_time AS [80th Percentile]
            FROM
                (SELECT *, ROW_NUMBER() OVER(ORDER BY r_time) AS Rank
                FROM reallocation_days) sq2
            WHERE rank = (SELECT CAST((COUNT(*) * 0.95) + 1 AS INT) FROM reallocation_days)
        
        --Using Percentile_cont()
        SELECT  DISTINCT region_id,
                CONVERT(DEC(10,2), PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY r_time) OVER(PARTITION BY region_id)) AS [80th Percentile],
                CONVERT(DEC(10,2), PERCENTILE_CONT(.8) WITHIN GROUP (ORDER BY r_time) OVER(PARTITION BY region_id)) AS [80th Percentile],
                CONVERT(DEC(10,2), PERCENTILE_CONT(.95) WITHIN GROUP(ORDER BY r_time) OVER(PARTITION BY region_id)) AS [95th Percentile]
        FROM reallocation_days
```

## B. Customer Transactions

   1. What is the unique count and total amount for each transaction type?
   
```sql
        -- Using Group By
            SELECT txn_type, COUNT(customer_id) #transactions, SUM(txn_amount) #total_amount
            FROM customer_transactions
            GROUP BY txn_type
            ORDER BY txn_type

        -- Using correlated subquery
            SELECT DISTINCT txn_type, 
                   (SELECT COUNT(*) FROM customer_transactions c1 WHERE c.txn_type = c1.txn_type) #transactions,
                   (SELECT SUM(txn_amount) FROM customer_transactions c2 WHERE c.txn_type = c2.txn_type) #total_amount
            FROM customer_transactions c
            ORDER BY txn_type
        
        -- Using Window functions
            SELECT DISTINCT txn_type,
                   COUNT(customer_id) OVER(PARTITION BY  txn_type) #transactions,
                   SUM(txn_amount) OVER(PARTITION BY txn_type) #total_amount
            FROM customer_transactions
            ORDER BY txn_type
```
   2. What is the average total historical deposit counts and amounts for all customers?
   
```sql
        -- Using Group By
            SELECT AVG(#tot_deposit_amount) Avg_deposit, AVG(#deposits) Num_deposits
            FROM    
                (SELECT customer_id, txn_type, SUM(txn_amount) #tot_deposit_amount, COUNT(*) #deposits 
                FROM customer_transactions
                WHERE txn_type = 'deposit'
                GROUP BY customer_id, txn_type) sq
        -- Using Window Functions
            SELECT AVG(Total_deposit) Avg_deposit, AVG(#deposits) Num_deposits
            FROM
                (SELECT DISTINCT customer_id, 
                       SUM(txn_amount) OVER(PARTITION BY customer_id) AS Total_deposit,
                       COUNT(txn_amount) OVER(PARTITION BY customer_id) AS #deposits
                FROM customer_transactions
                WHERE txn_type = 'deposit') sq
```
   3. For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?
   
```sql
        SELECT Month, COUNT(DISTINCT customer_id) AS #customers
        FROM 
            (SELECT customer_id, DATEPART(mm,txn_date) M, DATENAME(mm,txn_date) Month,
                (SELECT COUNT(txn_type) FROM customer_transactions ct WHERE txn_type = 'deposit' AND c.customer_id = ct.customer_id ) #deposit,
                (SELECT COUNT(txn_type) FROM customer_transactions ct WHERE txn_type = 'withdrawal' AND c.customer_id = ct.customer_id) #withdrawal,
                (SELECT COUNT(txn_type) FROM customer_transactions ct WHERE txn_type = 'purchase' AND c.customer_id = ct.customer_id ) #purchase
            FROM customer_transactions c) sq
        WHERE #deposit > 1 AND (#purchase = 1 OR #withdrawal = 1)
        GROUP BY Month;
```
   4. What is the closing balance for each customer at the end of the month?
   
```sql
        -- Using Correlated subqueries
            WITH sq AS
                (SELECT DISTINCT customer_id, DATEPART(MM,txn_date) M, DATENAME(MM,txn_date) AS Month,
                        (SELECT SUM(txn_amount) FROM customer_transactions c1 WHERE txn_type = 'deposit' 
                            AND c.customer_id = c1.customer_id AND DATENAME(MM,c.txn_date) = DATENAME(MM,c1.txn_date)) #deposits,
                        (SELECT SUM(txn_amount) FROM customer_transactions c2 WHERE txn_type = 'withdrawal' 
                            AND c.customer_id = c2.customer_id AND DATENAME(MM,c.txn_date) = DATENAME(MM,c2.txn_date)) #withdrawal,
                        (SELECT SUM(txn_amount) FROM customer_transactions c3 WHERE txn_type = 'purchase' 
                            AND c.customer_id = c3.customer_id AND DATENAME(MM,c.txn_date) = DATENAME(MM,c3.txn_date)) #purchase
                FROM customer_transactions c) 
            --
            SELECT *
            FROM
                (SELECT customer_id, [Month], (ISNULL(#deposits,0) - (ISNULL(#withdrawal,0) + ISNULL(#purchase,0))) AS balance
                FROM sq) q
            WHERE balance IS NOT NULL;

        -- Using Joins
            WITH CTE AS
                (SELECT DISTINCT c.customer_id, DATEPART(MM,txn_date) M, DATENAME(MM,txn_date) Months, 
                    ISNULL(deposit,0) Deposit, ISNULL(withdrawal,0) Withdrawal, ISNULL(purchases,0) Purchases
                FROM customer_transactions c
                LEFT JOIN  (SELECT customer_id, DATEPART(MM,txn_date) M, SUM(txn_amount) deposit
                            FROM customer_transactions
                            WHERE txn_type = 'deposit'
                            GROUP BY customer_id, DATEPART(MM,txn_date)) c1
                ON c.customer_id = c1.customer_id AND DATEPART(MM,c.txn_date) = c1.M
                LEFT JOIN  (SELECT customer_id, DATEPART(MM,txn_date) M, SUM(txn_amount) withdrawal
                            FROM customer_transactions
                            WHERE txn_type = 'withdrawal'
                            GROUP BY customer_id, DATEPART(MM,txn_date)) c2
                ON c.customer_id = c2.customer_id AND DATEPART(MM,c.txn_date) = c2.M
                LEFT JOIN  (SELECT customer_id, DATEPART(MM,txn_date) M, SUM(txn_amount) purchases
                            FROM customer_transactions
                            WHERE txn_type = 'purchase'
                            GROUP BY customer_id, DATEPART(MM,txn_date)) c3
                ON c.customer_id = c3.customer_id AND DATEPART(MM,c.txn_date) = c3.M)
            -- 
            SELECT *, (Deposit - Withdrawal - Purchases) Balance
            FROM CTE; 
```
   5. What is the percentage of customers who increase their closing balance by more than 5%?
   
## C. Data Allocation Challenge
   
   To test out a few different hypotheses - the Data Bank team wants to run an experiment where different groups of customers would be allocated data using 3 different options:

   - Option 1: data is allocated based off the amount of money at the end of the previous mont
   - Option 2: data is allocated on the average amount of money kept in the account in the previous 30 days
   - Option 3: data is updated real-time
   
   For this multi-part challenge question - you have been requested to generate the following data elements to help the Data Bank team estimate how much data will need to be provisioned for each option:
   - running customer balance column that includes the impact each transaction
   - customer balance at the end of each month
   - minimum, average and maximum values of the running balance for each customer
   
   Using all of the data available - how much data would have been required for each option on a monthly basis?
   
```sql
        CREATE OR ALTER VIEW Extra AS
            WITH Q1 AS
                (SELECT DISTINCT c.customer_id, DATEPART(MM,txn_date) M, DATENAME(MM,txn_date) Months, 
                    ISNULL(deposit,0) Deposit, ISNULL(withdrawal,0) Withdrawal, ISNULL(purchases,0) Purchases
                FROM customer_transactions c
                LEFT JOIN  (SELECT customer_id, DATEPART(MM,txn_date) M, SUM(txn_amount) deposit
                            FROM customer_transactions
                            WHERE txn_type = 'deposit'
                            GROUP BY customer_id, DATEPART(MM,txn_date)) c1
                ON c.customer_id = c1.customer_id AND DATEPART(MM,c.txn_date) = c1.M
                LEFT JOIN  (SELECT customer_id, DATEPART(MM,txn_date) M, SUM(txn_amount) withdrawal
                            FROM customer_transactions
                            WHERE txn_type = 'withdrawal'
                            GROUP BY customer_id, DATEPART(MM,txn_date)) c2
                ON c.customer_id = c2.customer_id AND DATEPART(MM,c.txn_date) = c2.M
                LEFT JOIN  (SELECT customer_id, DATEPART(MM,txn_date) M, SUM(txn_amount) purchases
                            FROM customer_transactions
                            WHERE txn_type = 'purchase'
                            GROUP BY customer_id, DATEPART(MM,txn_date)) c3
                ON c.customer_id = c3.customer_id AND DATEPART(MM,c.txn_date) = c3.M)
            -- 
            SELECT *, MIN(Running_Balance) OVER(PARTITION BY customer_id) AS Min_Running_Balance,
                      MAX(Running_Balance) OVER(PARTITION BY customer_id) AS Max_Running_Balance,
                      AVG(Running_Balance) OVER(PARTITION BY customer_id) AS Avg_Running_Balance
            FROM
                (SELECT *, SUM(Balance) OVER(PARTITION BY customer_id ORDER BY M) AS Running_Balance
                FROM
                    (SELECT *, (Deposit - Withdrawal - Purchases) Balance
                    FROM Q1) Q2) Q3
```
  
  </p>
  </details>

