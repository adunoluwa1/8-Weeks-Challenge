# 8-Week SQL Challenge - Foodie-Fi
[```Home```](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge) [```🌐 Case Study #3 - Foodie-Fi```](https://8weeksqlchallenge.com/case-study-3/)

![image](https://user-images.githubusercontent.com/99233674/199063943-067e748a-f933-4257-abd4-bb4e066d7a16.png)

# 📕 Table of Contents
- [🛠️ Background Statement](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/blob/main/Week_3/ReadMe.md#%EF%B8%8F-background-statement)
- [📂 Dataset](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/blob/main/Week_3/ReadMe.md#-dataset)
- [✒️ Case Study Questions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/blob/main/Week_3/ReadMe.md#%EF%B8%8F-case-study-questions) 
- [🏆 Solutions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/blob/main/Week_3/ReadMe.md#-solutions)

# 🛠️ Background Statement
> Subscription based businesses are super popular and Danny realised that there was a large gap in the market - he wanted to create a new streaming service that only had food related content - something like Netflix but with only cooking shows!

> Danny finds a few smart friends to launch his new startup Foodie-Fi in 2020 and started selling monthly and annual subscriptions, giving their customers unlimited on-demand access to exclusive food videos from around the world!

> Danny created Foodie-Fi with a data driven mindset and wanted to ensure all future investment decisions and new features were decided using data. This case study focuses on using subscription style digital data to answer important business questions.

# 📂 Dataset
This case study has 2 key tables but there is a challenge to create a new table for the Foodie-Fi team

<details><summary>View Datasets</summary>
  <p>

- Plans

  Customers can choose which plans to join Foodie-Fi when they first sign up.

  Basic plan customers have limited access and can only stream their videos and is only available monthly at $9.90

  Pro plan customers have no watch time limits and are able to download videos for offline viewing. Pro plans start at $19.90 a month or $199 for an annual subscription.

  Customers can sign up to an initial 7 day free trial will automatically continue with the pro monthly subscription plan unless they cancel, downgrade to basic or upgrade to an annual pro plan at any point during the trial.

  When customers cancel their Foodie-Fi service - they will have a churn plan record with a null price but their plan will continue until the end of the billing period. 
  
  <details><summary>View table</summary>
    <p>
  
    |plan_id |  plan_name       |   price   |
    |--------|------------------|-----------|
    |0       |  trial           |   0       |
    |1       |  basic monthly   |   9.90    |
    |2       |  pro monthly     |   19.90   |
    |3       |  pro annual      |   199     |
    |4       |  churn           |   null    |

    </p>
  </details>

- Subscritpions

   Customer subscriptions show the exact date where their specific plan_id starts.

   If customers downgrade from a pro plan or cancel their subscription - the higher plan will remain in place until the period is over - the start_date in the subscriptions table will reflect the date that the actual plan changes.

   When customers upgrade their account from a basic plan to a pro or annual pro plan - the higher plan will take effect straightaway.

   When customers churn - they will keep their access until the end of their current billing period but the start_date will be technically the day they decided to cancel their service.
   
  <details><summary>View table</summary>
    <p>
    
    |customer_id| plan_id  |   start_date      |
    |-----------|----------|-------------------|
    |    1      |    0     |   2020-08-01      |
    |    1      |    1     |   2020-08-08      |
    |    2      |    0     |   2020-09-20      |
    |    2      |    3     |   2020-09-27      |
    |    11     |    0     |   2020-11-19      |
    |    11     |    4     |   2020-11-26      |
    |    13     |    0     |   2020-12-15      |
    |    13     |    1     |   2020-12-22      |
    |    13     |    2     |   2021-03-29      |
    |    15     |    0     |   2020-03-17      |
    |    15     |    2     |   2020-03-24      |
    |    15     |    4     |   2020-04-29      |
    |    16     |    0     |   2020-05-31      |
    |    16     |    1     |   2020-06-07      |
    |    16     |    3     |   2020-10-21      |
    |    18     |    0     |   2020-07-06      |
    |    18     |    2     |   2020-07-13      |
    |    19     |    0     |   2020-06-22      |
    |    19     |    2     |   2020-06-29      |
    |    19     |    3     |   2020-08-29      |
    </p>
  </details>
  
  </p>
</details>
  
  
# ✒️ Case Study Questions
This case study is split into an initial data understanding question before diving straight into data analysis questions before finishing with 1 single extension challenge

## A. Customer Journey
   - Based off the 8 sample customers provided in the sample from the subscriptions table, write a brief description about each customer’s onboarding journey.
   - Try to keep it as short as possible - you may also want to run some sort of join to make your explanations a bit easier!

## B. Data Analysis Questions
   1. How many customers has Foodie-Fi ever had?
   2. What is the monthly distribution of trial plan start_date values for our dataset - use the start of the month as the group by value
   3. What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name
   4. What is the customer count and percentage of customers who have churned rounded to 1 decimal place?
   5. How many customers have churned straight after their initial free trial - what percentage is this rounded to the nearest whole number?
   6. What is the number and percentage of customer plans after their initial free trial?
   7. What is the customer count and percentage breakdown of all 5 plan_name values at 2020-12-31?
   8. How many customers have upgraded to an annual plan in 2020?
   9. How many days on average does it take for a customer to an annual plan from the day they join Foodie-Fi?
   10. Can you further breakdown this average value into 30 day periods (i.e. 0-30 days, 31-60 days etc)
   11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?
   
## C. Challenge Payment Question
The Foodie-Fi team wants you to create a new payments table for the year 2020 that includes amounts paid by each customer in the subscriptions table with the following requirements:
   - monthly payments always occur on the same day of month as the original start_date of any monthly paid plan
   - upgrades from basic to monthly or pro plans are reduced by the current paid amount in that month and start immediately
   - upgrades from pro monthly to pro annual are paid at the end of the current billing period and also starts at the end of the month period
   - once a customer churns they will no longer make payments
 
## Bonus Questions
> If Danny wants to expand his range of pizzas - how would this impact the existing data design? Write an INSERT statement to demonstrate what would happen if a new Supreme pizza with all the toppings was added to the Pizza Runner menu?


# 🏆 Solutions
  <details><summary>View solution</summary>
  <p>
  
- B. Data Analysis Questions
    
```sql
    -- 1. How many customers has Foodie-Fi ever had?
        SELECT COUNT(DISTINCT customer_id) AS [Number of Customers]
        FROM subscriptions
    -- 2. What is the monthly distribution of trial plan start_date values for our dataset - use the start of the month as the group by value
        -- Using Group By
            SELECT DATENAME(m,start_date) AS [Month], COUNT(*) AS [# Trial Subscriptions]
            FROM subscriptions
            WHERE plan_id = 0
            GROUP BY DATEPART(m,start_date), DATENAME(m,start_date)
            ORDER BY DATEPART(m,start_date)

        -- Using Window fxns
            SELECT DISTINCT DATENAME(m,start_date) AS [Month], COUNT(*) OVER(PARTITION BY DATENAME(m,start_date))
            FROM subscriptions
            WHERE plan_id = 0


    -- 3. What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name
        -- Using Group By
            SELECT plan_id, COUNT(*)  AS [# of Events]
            FROM subscriptions
            WHERE DATEPART(yy,start_date) > 2020
            GROUP BY plan_id

        -- Using Window functions
            SELECT DISTINCT plan_id, COUNT(*) OVER(PARTITION BY plan_id) AS [# of Events]
            FROM subscriptions
            WHERE DATEPART(yy,start_date) > 2020

        -- Using correlated subqueries
            SELECT DISTINCT s.plan_id, 
                   (SELECT COUNT(*)
                   FROM subscriptions q
                   WHERE s.plan_id = q.plan_id
                   AND DATEPART(yy,q.start_date) > 2020) AS [# of Events]
            FROM subscriptions s
            ORDER BY s.plan_id
            
    -- 4. What is the customer count and percentage of customers who have churned rounded to 1 decimal place?
        -- Using Window Functions & CTE
            WITH 
            Churned AS (
                 SELECT COUNT(q.[Last Plan]) AS [#Churned]
                 FROM
                     (SELECT DISTINCT s.customer_id, 
                         LAST_VALUE(s.plan_id) OVER(PARTITION BY s.customer_id ORDER BY s.start_date 
                         ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED  FOLLOWING) AS [Last Plan]
                     FROM subscriptions s
                     WHERE s.plan_id = 4) q),
 
            Total AS(
                 SELECT COUNT(DISTINCT customer_id) AS [#Total]
                 FROM subscriptions)
 
            ----
            SELECT c.#Churned, CAST((c.#Churned*100.0)/t.#Total AS DEC(10,1)) AS [%Churned]
            FROM Churned c,
                 Total t


        -- Using correlated subqueries
            SELECT sq.[# Churned], CONVERT(DEC(10,1),(sq.[# Churned]*100.0)/sq.[# Customers]) AS [% Churned]
            FROM
                (SELECT COUNT(DISTINCT customer_id) AS [# Customers], 
                    (SELECT COUNT(*) 
                    FROM subscriptions s
                    WHERE s.start_date = (SELECT MAX(q.start_date) 
                                        FROM subscriptions q
                                        WHERE s.customer_id = q.customer_id) AND s.plan_id = 4) AS [# Churned]
                FROM subscriptions) sq


    -- 5. How many customers have churned straight after their initial free trial - what percentage is this rounded to the nearest whole number?
        -- Using correlated subqueries
             SELECT sq.#Free_Trial_Churn, (sq.#free_trial_churn*100)/sq.#Total AS [%Free_Trial_Churn]
             FROM   
                (SELECT COUNT(DISTINCT r.customer_id) AS #Total,
                    (SELECT COUNT(DISTINCT s.customer_id) 
                    FROM subscriptions s
                    WHERE s.plan_id = 0 
                    AND  DATEADD(d,7,s.start_date) = (SELECT MAX(start_date)
                                                      FROM subscriptions q
                                                      WHERE s.customer_id = q.customer_id
                                                      AND q.plan_id = 4)) AS [#free_trial_churn]
                FROM subscriptions r) sq
        
        -- Using Window Functions 
            SELECT sq.#Free_Trial_Churn, (sq.#Free_Trial_Churn*100)/sq.#Total AS [%Free_Trial_Churn]
            FROM    
                (SELECT COUNT(*) AS #Free_Trial_Churn, (SELECT COUNT(DISTINCT q.customer_id) FROM subscriptions q) AS #Total  
                FROM subscriptions s1
                INNER JOIN
                    (SELECT DISTINCT customer_id, LAST_VALUE(start_date) OVER(PARTITION BY customer_id ORDER BY start_date
                                    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_plan
                    FROM subscriptions
                    WHERE plan_id = 4) s2
                ON s1.customer_id = s2.customer_id
                WHERE s1.plan_id = 0 AND DATEADD(d,-7,s2.last_plan) = s1.start_date) sq

    -- 6. What is the number and percentage of customer plans after their initial free trial?
        -- Using Group BY
            WITH 
                customers AS(
                    SELECT plan_id, COUNT(*) AS #customers
                    FROM 
                        (SELECT *, RANK() OVER(PARTITION BY customer_id ORDER BY start_date) AS Rank
                        FROM subscriptions) sq
                    WHERE sq.Rank = 2
                    GROUP BY plan_id),
                Total AS(
                    SELECT COUNT(DISTINCT customer_id) AS #Total FROM subscriptions)
            
            SELECT plan_name, #customers, CAST((#customers * 100.0)/#Total AS DEC(10,2)) AS [%customers]
            FROM Total, customers c
            LEFT JOIN plans p
            ON c.plan_id = p.plan_id
            ORDER BY p.plan_name
        
        -- Using correlated subqueries
            SELECT plan_id, #customers, CAST((#customers * 100.0)/q.#total AS DEC(10,2)) AS [%customers]
            FROM
                (SELECT  DISTINCT plan_id, 
                    (SELECT COUNT(*)
                        FROM subscriptions s1
                        WHERE s.plan_id = s1.plan_id
                        AND s1.start_date = (SELECT MIN(start_date)
                                            FROM subscriptions sq
                                            WHERE s1.customer_id = sq.customer_id
                                            AND sq.plan_id <> 0)) AS #customers,
                    (SELECT COUNT(DISTINCT s2.customer_id)
                        FROM subscriptions s2) AS #total
                FROM subscriptions s
                WHERE plan_id <> 0) q

 
    -- 7. What is the customer count and percentage breakdown of all 5 plan_name values at 2020-12-31?
        -- Multiple methods
            WITH churn AS
                    (SELECT *
                     FROM
                        (SELECT *,
                            CASE WHEN  (SELECT MAX(plan_id)
                                        FROM subscriptions q
                                        WHERE s.customer_id = q.customer_id) = 4 THEN 'Y'
                            ELSE 'N' END AS Churned
                        FROM              
                            (SELECT *
                             FROM subscriptions
                             WHERE start_date < '2020-12-31') s) sq
                     WHERE sq.Churned = 'N'),
                Total AS
                    (SELECT COUNT(DISTINCT customer_id) AS #Total 
                     FROM churn),
                Final AS
                    (SELECT sq.last_plan, COUNT(*) AS #Customers
                     FROM 
                         (SELECT DISTINCT customer_id, 
                                (SELECT plan_id 
                                 FROM churn x 
                                 WHERE x.customer_id = c.customer_id 
                                 AND x.start_date = (SELECT MAX(start_date) 
                                                     FROM churn y 
                                                     WHERE c.customer_id = y.customer_id )) AS [last_plan]
                         FROM churn c) sq, Total
                     GROUP BY sq.last_plan)
            --
            SELECT last_plan, CAST((#Customers*100.0)/#Total AS DEC(10,1)) AS [%Customers]
            FROM Final, Total
               
    -- 8. How many customers have upgraded to an annual plan in 2020?
            SELECT COUNT(*) AS #Upgraded
            FROM subscriptions
            WHERE DATEPART(yy,start_date) = 2020 AND plan_id = 3

    -- 9. How many days on average does it take for a customer to an annual plan from the day they join Foodie-Fi?
        -- Using correlated subqueries
            SELECT AVG(DATEDIFF(dd,sq.#joindate,sq.#upgradedate)) AS [Average Upgrade Time]
            FROM    
                (SELECT s.customer_id,
                (SELECT q.start_date FROM subscriptions q WHERE q.plan_id = 0 AND s.customer_id = q.customer_id) AS #joindate,
                (SELECT r.start_date FROM subscriptions r WHERE r.plan_id = 3 AND s.customer_id = r.customer_id) AS #upgradedate 
                FROM subscriptions s
                WHERE s.plan_id = 3) sq
            
        -- Using subqueries
            SELECT AVG(DATEDIFF(dd,sq1.#joindate,sq2.#upgradedate)) AS [Average Upgrade Time]
            FROM                
                (SELECT customer_id, start_date AS #joindate
                FROM subscriptions
                WHERE plan_id = 0) sq1
            INNER JOIN
                (SELECT customer_id, start_date AS #upgradedate 
                FROM subscriptions
                WHERE plan_id = 3) sq2
            ON sq1.customer_id = sq2.customer_id

    -- 10. Can you further breakdown this average value into 30 day periods (i.e. 0-30 days, 31-60 days etc)
        -- 
            SELECT Periods, COUNT(*) AS #Customers,AVG(DATEDIFF(dd,sq1.#joindate,sq1.#upgradedate)) AS [Average Upgrade Time]
            FROM
                (SELECT *,
                        CASE 
                            WHEN DATEDIFF(dd,sq.#joindate,sq.#upgradedate) <= 30 THEN '0-30 days'
                            WHEN DATEDIFF(dd,sq.#joindate,sq.#upgradedate) <= 60 THEN '30-60 days'
                            WHEN DATEDIFF(dd,sq.#joindate,sq.#upgradedate) <= 90 THEN '60-90 days'
                            WHEN DATEDIFF(dd,sq.#joindate,sq.#upgradedate) <= 120 THEN '90-120 days'
                            WHEN DATEDIFF(dd,sq.#joindate,sq.#upgradedate) <= 150 THEN '120-150 days'
                            WHEN DATEDIFF(dd,sq.#joindate,sq.#upgradedate) <= 180 THEN '150-180 days'
                            ELSE'180+ days'
                        END AS Periods
                FROM    
                    (SELECT s.customer_id,
                    (SELECT q.start_date FROM subscriptions q WHERE q.plan_id = 0 AND s.customer_id = q.customer_id) AS #joindate,
                    (SELECT r.start_date FROM subscriptions r WHERE r.plan_id = 3 AND s.customer_id = r.customer_id) AS #upgradedate 
                    FROM subscriptions s
                    WHERE s.plan_id = 3) sq) sq1
            GROUP BY Periods

            --
    -- 11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?
            SELECT COUNT(*) #Customers
            FROM
                (SELECT DISTINCT s.customer_id,
                    (SELECT q.start_date FROM subscriptions q WHERE q.plan_id = 2 AND s.customer_id = q.customer_id) AS pro_subdate,
                    (SELECT r.start_date FROM subscriptions r WHERE r.plan_id = 1 AND s.customer_id = r.customer_id) AS basic_subdate
                FROM subscriptions s) sq
            WHERE sq.pro_subdate IS NOT NULL AND sq.basic_subdate IS NOT NULL AND DATEPART(yy,basic_subdate) = 2020 AND Pro_subdate < basic_subdate 
```

- C. Challenge Payment Question
   
```sql
    -- The Foodie-Fi team wants you to create a new payments table for the year 2020 that includes amounts paid by each customer in the subscriptions table

         CREATE OR ALTER VIEW Q3 AS
             SELECT customer_id, s.plan_id, plan_name, start_date, price, 
             ROW_NUMBER() OVER(PARTITION BY s.customer_id ORDER BY start_date) AS Rank
             FROM subscriptions s
             LEFT JOIN plans p
             ON s.plan_id = p.plan_id
             WHERE s.plan_id <> 0  AND DATEPART(yy,s.start_date) = 2020 
             AND customer_id NOT IN (SELECT s1.customer_id
                                     FROM subscriptions s1
                                     WHERE start_date = (SELECT MAX(start_date)
                                                         FROM subscriptions s2
                                                         WHERE s1.customer_id = s2.customer_id)
                                     AND s1.plan_id = 4)

            
            SELECT * FROM Q3;

        -- Using Recursive CTEs ***
            WITH test_cte AS(
                SELECT q.customer_id,
                       q.plan_id,
                       q.start_date AS p_date,
                       q.rank
                FROM Q3 q

                UNION ALL

                SELECT q.customer_id, q.plan_id, q.p_date, q.rank
                FROM
                    (SELECT s.customer_id,
                           s.plan_id,
                           CASE WHEN s.plan_id IN (1,2) THEN DATEADD(mm,1,p_date)
                                ELSE DATEADD(yy,1,p_date) END AS p_date,
                           s.rank
                    FROM  test_cte s) q
                WHERE p_date < ISNULL((SELECT s2.start_date
                                                     FROM Q3 s2
                                                     WHERE q.customer_id = s2.customer_id 
                                                     AND S2.rank = q.rank + 1),'2020-12-31')
            )

              SELECT customer_id, plan_id, plan_name, payment_date, 
                     CASE WHEN amount <> prev_payment AND payment_date <> DATEADD(mm,1,prev_date) THEN amount - prev_payment
                          ELSE amount
                     END AS p_amount,
                     payment_ord
            --   INTO test_table
              FROM
                     (SELECT customer_id, t.plan_id, p.plan_name, p_date [payment_date], p.price [amount],
                            LAG(p.price) OVER(PARTITION BY customer_id ORDER BY p_date) AS [prev_payment],
                            LAG(p_date) OVER(PARTITION BY customer_id ORDER BY p_date) AS [prev_date],
                            ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY p_date) AS payment_ord
                     FROM test_cte t
                     LEFT JOIN plans p
                     ON t.plan_id = p.plan_id) sq
              ORDER BY customer_id, plan_id, payment_date

 
        SELECT * FROM TEST_TABLE
        
```

  
  </p>
  </details>

