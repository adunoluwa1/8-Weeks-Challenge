# 8-Week SQL Challenge 
# Cast Study #8 - Fresh Segments

[```Home```](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge) [```🌐 Case Study #8 - Fresh Segments```](https://8weeksqlchallenge.com/case-study-8/)

![image](https://user-images.githubusercontent.com/99233674/200472997-a638419c-c5ac-40a4-b1d3-31fed5d1f702.png)

# 📕 Table of Contents
- [🛠️ Background Statement](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_5#%EF%B8%8F-background-statement)
- [📂 Dataset](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_5#-dataset)
- [✒️ Case Study Questions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_5#%EF%B8%8F-case-study-questions)
- [🏆 Solutions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_5#-solutions)

# 🛠️ Background Statement
> Danny created Fresh Segments, a digital marketing agency that helps other businesses analyse trends in online ad click behaviour for their unique customer base.

> Clients share their customer lists with the Fresh Segments team who then aggregate interest metrics and generate a single dataset worth of metrics for further analysis.

> In particular - the composition and rankings for different interests are provided for each client showing the proportion of their customer list who interacted with online assets related to each interest for each month.

> Danny has asked for your assistance to analyse aggregated metrics for an example client and provide some high level insights about the customer list and their interests.


# 📂 Dataset
For this case study there is a total of 2 datasets which you will need to use to solve the questions.

<details><summary>View Datasets</summary>
  <p>

- Interest Metrics
    
  This table contains information about aggregated interest metrics for a specific major client of Fresh Segments which makes up a large proportion of their customer base.

  Each record in this table represents the performance of a specific interest_id based on the client’s customer base interest measured through clicks and interactions with specific targeted advertising content. 
  
  <details><summary>View table</summary>
    <p>
  
    |_month |	_year   |	month_year  |	interest_id |	composition| index_value |	ranking |	percentile_ranking  |
    |-------|-----------|---------------|---------------|--------------|-------------|----------|-----------------------|
    |7      |	2018    |	07-2018     |	32486   	| 11.89        |	6.19     |	1       |	99.86               |
    |7      |	2018    |	07-2018     |	6106    	| 9.93         |	5.31     |	2       |	99.73               |
    |7      |	2018    |	07-2018     |	18923   	| 10.85        |	5.29     |	3       |	99.59               |
    |7      |	2018    |	07-2018     |	6344    	| 10.32        |	5.1      |	4       |	99.45               |
    |7      |	2018    |	07-2018     |	100 	    | 10.77        |	5.04     |	5       |	99.31               |
    |7      |	2018    |	07-2018     |	69  	    | 10.82        |	5.03     |	6       |	99.18               |
    |7      |	2018    |	07-2018     |	79  	    | 11.21        |	4.97     |	7       |	99.04               |
    |7      |	2018    |	07-2018     |	6111    	| 10.71        |	4.83     |	8       |	98.9                |
    |7      |	2018    |	07-2018     |	6214    	| 9.71         |	4.83     |	8       |	98.9                |
    |7      |	2018    |	07-2018     |	19422   	| 10.11        |	4.81     |	10      |	98.63               |

      
    </p>
  </details>

  > For example - let’s interpret the first row of the interest_metrics table together:

    |_month	|_year | month_year| interest_id| composition |	index_value | ranking |	percentile_ranking |
    |-------|------|-----------|------------|-------------|-------------|---------|--------------------|
    |7	    |2018  | 07-2018   | 32486      | 11.89       |	6.19        |	1     |	99.86              |
  
  > In July 2018, the composition metric is 11.89, meaning that 11.89% of the client’s customer list interacted with the interest interest_id = 32486 - we can link interest_id to a separate mapping table to find the segment name called “Vacation Rental Accommodation Researchers”

  > The index_value is 6.19, means that the composition value is 6.19x the average composition value for all Fresh Segments clients’ customer for this particular interest in the month of July 2018.

  > The ranking and percentage_ranking relates to the order of index_value records in each month year.
    
- Interest Map
    
  This mapping table links the interest_id with their relevant interest information. You will need to join this table onto the previous interest_details table to obtain the interest_name as well as any details about the summary information.
  
  <details><summary>View table</summary>
    <p>
  
    |id |	interest_name	            |   interest_summary	                                                               |created_at           |	last_modified       |
    |---|-------------------------------|--------------------------------------------------------------------------------------|---------------------|----------------------|
    |1  |	Fitness Enthusiasts         |	Consumers using fitness tracking apps and websites.	                               | 2016-05-26 14:57:59 |	2018-05-23 11:30:12 |
    |2  |	Gamers	                    |   Consumers researching game reviews and cheat codes.                                | 2016-05-26 14:57:59 |	2018-05-23 11:30:12 |
    |3  |	Car Enthusiasts	            |   Readers of automotive news and car reviews.	                                       | 2016-05-26 14:57:59 |	2018-05-23 11:30:12 |
    |4  |	Luxury Retail Researchers   |	Consumers researching luxury product reviews and gift ideas.                       | 2016-05-26 14:57:59 |	2018-05-23 11:30:12 |
    |5  |	Brides & Wedding Planners   |	People researching wedding ideas and vendors.	                                   | 2016-05-26 14:57:59 |	2018-05-23 11:30:12 |
    |6  |	Vacation Planners	        |   Consumers reading reviews of vacation destinations and accommodations.             | 2016-05-26 14:57:59 |	2018-05-23 11:30:13 |
    |7  |	Motorcycle Enthusiasts	    |   Readers of motorcycle news and reviews.	                                           | 2016-05-26 14:57:59 |	2018-05-23 11:30:13 |
    |8  |	Business News Readers       |	Readers of online business news content.	                                       | 2016-05-26 14:57:59 |	2018-05-23 11:30:12 |
    |12 |	Thrift Store Shoppers       |	Consumers shopping online for clothing at thrift stores and researching locations. | 2016-05-26 14:57:59 |	2018-03-16 13:14:00 |
    |13 |	Advertising Professionals   |	People who read advertising industry news.	                                       | 2016-05-26 14:57:59 |	2018-05-23 11:30:12 |
     
    </p>
  </details>
  </p>
</details>
  
  
# ✒️ Case Study Questions
The following case study questions include some general data exploration analysis for the nodes and transactions before diving right into the core business questions and finishes with a challenging final request!

## A. Data Exploration and Cleansing
   
   1. Update the fresh_segments.interest_metrics table by modifying the month_year column to be a date data type with the start of the month
   2. What is count of records in the fresh_segments.interest_metrics for each month_year value sorted in chronological order (earliest to latest) with the null values appearing first?
   3. What do you think we should do with these null values in the fresh_segments.interest_metrics
   4. How many interest_id values exist in the fresh_segments.interest_metrics table but not in the fresh_segments.interest_map table? What about the other way around
   5. Summarise the id values in the fresh_segments.interest_map by its total record count in this table
   6. What sort of table join should we perform for our analysis and why? Check your logic by checking the rows where interest_id = 21246 in your joined output and include all columns from fresh_segments.interest_metrics and all columns from fresh_segments.interest_map except from the id column.
   7. Are there any records in your joined table where the month_year value is before the created_at value from the fresh_segments.interest_map table? Do you think these values are valid and why?

## B. Interest Analysis

   1. Which interests have been present in all month_year dates in our dataset?
   2. Using this same total_months measure - calculate the cumulative percentage of all records starting at 14 months - which total_months value passes the 90% cumulative percentage value?
   3. If we were to remove all interest_id values which are lower than the total_months value we found in the previous question - how many total data points would we be removing?
   4. Does this decision make sense to remove these data points from a business perspective? Use an example where there are all 14 months present to a removed interest example for your arguments - think about what it means to have less months present from a segment perspective.
   5. After removing these interests - how many unique interests are there for each month?
   
## C. Segment Analysis
   
   1. Using our filtered dataset by removing the interests with less than 6 months worth of data, which are the top 10 and bottom 10 interests which have the largest composition values in any month_year? Only use the maximum composition value for each interest but you must keep the corresponding month_year
   2. Which 5 interests had the lowest average ranking value?
   3. Which 5 interests had the largest standard deviation in their percentile_ranking value?
   4. For the 5 interests found in the previous question - what was minimum and maximum percentile_ranking values for each interest and its corresponding year_month value? Can you describe what is happening for these 5 interests?
   5. How would you describe our customers in this segment based off their composition and ranking values? What sort of products or services should we show to these customers and what should we avoid?

## D. Index Analysis
  The index_value is a measure which can be used to reverse calculate the average composition for Fresh Segments’ clients.
  
  Average composition can be calculated by dividing the composition column by the index_value column rounded to 2 decimal places.
  1. What is the top 10 interests by the average composition for each month?
  2. For all of these top 10 interests - which interest appears the most often?
  3. What is the average of the average composition for the top 10 interests for each month?
  4. What is the 3 month rolling average of the max average composition value from September 2018 to August 2019 and include the previous top ranking interests in the same output shown below.
  5. Provide a possible reason why the max average composition might change from month to month? Could it signal something is not quite right with the overall business model for Fresh Segments?
  
  Required output for question 4:
 
    |month_year	|       interest_name                | max_index_composition |3_month_moving_avg |1_month_ago                          |   	2_months_ago                      |
    |-----------|------------------------------------|-----------------------|-------------------|-------------------------------------|--------------------------------------|
    |2018-09-01 |	Work Comes First Travelers       |	 8.26                |	7.61	         |   Las Vegas Trip Planners: 7.21	   |   Las Vegas Trip Planners: 7.36      |    
    |2018-10-01 |	Work Comes First Travelers       |	 9.14                |	8.20	         |   Work Comes First Travelers: 8.26  |   	Las Vegas Trip Planners: 7.21     |    
    |2018-11-01 |	Work Comes First Travelers       |	 8.28                |	8.56	         |   Work Comes First Travelers: 9.14  |   	Work Comes First Travelers: 8.26  |
    |2018-12-01 |	Work Comes First Travelers       |	 8.31                |	8.58	         |   Work Comes First Travelers: 8.28  |   	Work Comes First Travelers: 9.14  |
    |2019-01-01 |	Work Comes First Travelers       |	 7.66                |	8.08	         |   Work Comes First Travelers: 8.31  |   	Work Comes First Travelers: 8.28  |
    |2019-02-01 |	Work Comes First Travelers       |	 7.66                |	7.88	         |   Work Comes First Travelers: 7.66  |   	Work Comes First Travelers: 8.31  |
    |2019-03-01 |	Alabama Trip Planners       	 |   6.54                |	7.29	         |   Work Comes First Travelers: 7.66  |   	Work Comes First Travelers: 7.66  |
    |2019-04-01 |	Solar Energy Researchers         |	 6.28                |	6.83	         |   Alabama Trip Planners: 6.54	   |   Work Comes First Travelers: 7.66   |
    |2019-05-01 |	Readers of Honduran Content      |	 4.41                |	5.74	         |   Solar Energy Researchers: 6.28	   |   Alabama Trip Planners: 6.54        |
    |2019-06-01 |	Las Vegas Trip Planners     	 |   2.77                |	4.49	         |   Readers of Honduran Content: 4.41 |   	Solar Energy Researchers: 6.28    |
    |2019-07-01 |	Las Vegas Trip Planners     	 |   2.82                |	3.33	         |   Las Vegas Trip Planners: 2.77	   |   Readers of Honduran Content: 4.41  |
    |2019-08-01 |	Cosmetics and Beauty Shoppers    |   2.73                |	2.77	         |   Las Vegas Trip Planners: 2.82	   |   Las Vegas Trip Planners: 2.77      |


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

