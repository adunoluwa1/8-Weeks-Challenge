# 8-Week SQL Challenge 
# Cast Study #5 - Data Mart

[```Home```](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge) [```🌐 Case Study #6 - Data Mart```](https://8weeksqlchallenge.com/case-study-5/)

![image](https://user-images.githubusercontent.com/99233674/199310103-d2e6237b-2fa4-43af-b408-defe11a727e0.png)

# 📕 Table of Contents
- [🛠️ Background Statement](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_6#%EF%B8%8F-background-statement)
- [📂 Dataset](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_6#-dataset)
- [✒️ Case Study Questions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_6#%EF%B8%8F-case-study-questions) 
- [🏆 Solutions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/tree/main/Week_6#-solutions)

# 🛠️ Background Statement
> Data Mart is Danny’s latest venture and after running international operations for his online supermarket that specialises in fresh produce - Danny is asking for your support to analyse his sales performance.

> In June 2020 - large scale supply changes were made at Data Mart. All Data Mart products now use sustainable packaging methods in every single step from the farm all the way to the customer.

> Danny needs your help to quantify the impact of this change on the sales performance for Data Mart and it’s separate business areas

> The key business question he wants you to help him answer are the following:
  - What was the quantifiable impact of the changes introduced in June 2020?
  - Which platform, region, segment and customer types were the most impacted by this change?
  - What can we do about future introduction of similar sustainability updates to the business to minimise impact on sales?

# 📂 Dataset
For this case study there is only a single table: weekly_sales

<details><summary>View Datasets</summary>
  <p>

- Weekly Sales
    
  ### Column Dictionary
      The columns are pretty self-explanatory based on the column names but here are some further details about the dataset:
       
      1. Data Mart has international operations using a multi-region strategy
      2. Data Mart has both, a retail and online platform in the form of a Shopify store front to serve their customers
      3. Customer segment and customer_type data relates to personal age and demographics information that is shared with Data Mart
      4. transactions is the count of unique purchases made through Data Mart and sales is the actual dollar amount of purchases
      Each record in the dataset is related to a specific aggregated slice of the underlying sales data rolled up into a week_date value which represents the start of the sales week.
    
  <details><summary>View table</summary>
    <p>
  
  ```
  Weekly Sales
  ```
    </p>
  </details>

  </p>
</details>
  
  
# ✒️ Case Study Questions
The following case study questions require some data cleaning steps before we start to unpack Danny’s key business questions in more depth.

## Data Cleansing Steps
   In a single query, perform the following operations and generate a new table in the data_mart schema named clean_weekly_sales:
   1. Convert the week_date to a DATE format
   2. Add a week_number as the second column for each week_date value, for example any value from the 1st of January to 7th of January will be 1, 8th to 14th will be 2 etc
   3. Add a month_number with the calendar month for each week_date value as the 3rd column
   4. Add a calendar_year column as the 4th column containing either 2018, 2019 or 2020 values
   5. Add a new column called age_band after the original segment column using the following mapping on the number inside the segment value
      |segment|	age_band   |
      |-------|------------|
      |1	    |Young Adults|
      |2	    |Middle Aged |
      |3 or 4 |Retirees    |
   6. Add a new demographic column using the following mapping for the first letter in the segment values:
      
      |segment|	demographic|
      |-------|------------|
      |C	    |Couples     |
      |F	    |Families    |
   7. Ensure all null string values with an "unknown" string value in the original segment column as well as the new age_band and demographic columns
   8. Generate a new avg_transaction column as the sales value divided by transactions rounded to 2 decimal places for each record

## Data Exploration
   1. What day of the week is used for each week_date value?
   2. What range of week numbers are missing from the dataset?
   3. How many total transactions were there for each year in the dataset?
   4. What is the total sales for each region for each month?
   5. What is the total count of transactions for each platform
   6. What is the percentage of sales for Retail vs Shopify for each month?
   7. What is the percentage of sales by demographic for each year in the dataset?
   8. Which age_band and demographic values contribute the most to Retail sales?
   9. Can we use the avg_transaction column to find the average transaction size for each year for Retail vs Shopify? If not - how would you calculate it instead?
   
## Product Analysis
   
   This technique is usually used when we inspect an important event and want to inspect the impact before and after a certain point in time.

   Taking the week_date value of 2020-06-15 as the baseline week where the Data Mart sustainable packaging changes came into effect.

   We would include all week_date values for 2020-06-15 as the start of the period after the change and the previous week_date values would be before

   Using this analysis approach - answer the following questions:
   1. What is the total sales for the 4 weeks before and after 2020-06-15?
      - What is the growth or reduction rate in actual values and percentage of sales?
   2. What about the entire 12 weeks before and after?
   3. How do the sale metrics for these 2 periods before and after compare with the previous years in 2018 and 2019?
   

## Reporting Challenge
  > Write a single SQL script that combines all of the previous questions into a scheduled report that the Balanced Tree team can run at the beginning of each month to calculate the previous month’s values.
  
  > Imagine that the Chief Financial Officer (which is also Danny) has asked for all of these questions at the end of every month.
  
  > He first wants you to generate the data for January only - but then he also wants you to demonstrate that you can easily run the samne analysis for February without many changes (if at all).
  
  > Feel free to split up your final outputs into as many tables as you need - but be sure to explicitly reference which table outputs relate to which question for full marks :)
   
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
  
#### Digital Analysis
   1. How many users are there?
    
```sql
            SELECT COUNT(DISTINCT user_id) AS [#Users]
            FROM events e
            LEFT JOIN users u
            ON u.cookie_id =e.cookie_id

            SELECT COUNT(DISTINCT user_id) AS [#Users]
            FROM users
```
   2. How many cookies does each user have on average?
        
```sql
        -- Using Group
            SELECT AVG(#cookies) AS Avg_Cookies
            FROM    
                (SELECT user_id, COUNT(cookie_id) AS [#cookies]
                FROM users
                GROUP BY user_id) Q

        -- Using Window Functions
            SELECT AVG(#cookies) AS Avg_Cookies
            FROM
                (SELECT user_id,
                 COUNT(cookie_id) OVER(PARTITION BY user_id) AS [#cookies]
                 FROM users) Q
        
```
   3. What is the unique number of visits by all users per month?
       
```sql
        -- Using Window Fuctions    
            SELECT DISTINCT Num, [Month], LAST_VALUE([#Rank]) OVER(PARTITION BY Month ORDER BY Month) AS #Visits
            FROM    
                (SELECT DISTINCT DATEPART(MM,event_time) AS Num, DATENAME(MM,event_time) AS Month, Visit_id,
                    DENSE_RANK() OVER(PARTITION BY DATEPART(MM,event_time) ORDER BY Visit_id) AS [#Rank]
                FROM events) Q
            ORDER BY Num
        

        -- Using Group By
            SELECT DATEPART(MM,event_time) AS Num, DATENAME(MM,event_time) AS Month,
                   COUNT(DISTINCT visit_id) AS #visits
            FROM events
            GROUP BY DATEPART(MM,event_time), DATENAME(MM,event_time)
            ORDER BY [Num]
        
        -- Using Correlated Subqueries
            SELECT DISTINCT DATEPART(MM,event_time) AS Num, DATENAME(MM,event_time) AS Month,
                   (SELECT COUNT(DISTINCT v.visit_id)
                    FROM events v
                    WHERE DATEPART(MM,v.event_time) = DATEPART(MM,e.event_time)) #visits
            FROM events e
            ORDER BY [Num]
    
```
   4. What is the number of events for each event type?
           
```sql
        -- Using Group By
            SELECT event_type, COUNT(*) AS #events
            FROM events
            GROUP BY event_type
            ORDER BY event_type
        -- Using WIndow functions
            SELECT DISTINCT event_type, COUNT(*) OVER(PARTITION BY event_type) AS #events
            FROM events
            ORDER BY event_type
        -- Using correlated subquery
            SELECT DISTINCT event_type, 
                   (SELECT COUNT(*)
                    FROM events v
                    WHERE v.event_type = e.event_type) #events
            FROM events e
            ORDER BY event_type    
```
   5. What is the percentage of visits which have a purchase event?
          
```sql
        -- Using CTEs
            WITH 
                tot_visits AS
                (SELECT COUNT(DISTINCT visit_id) #Total
                FROM events),
                tot_purchase AS
                (SELECT COUNT(DISTINCT visit_id) #Purchase
                FROM events
                WHERE event_type = 3)

                SELECT CAST((#purchase*100.0)/#Total AS DEC(10,2)) AS [% Purchase Events]
                FROM tot_visits, tot_purchase

        -- By CTEs and Pivoting
            -- Using CTEs
                -- Packing CTE
                    WITH temp_CTE AS    
                        -- Derived Table
                            (SELECT *
                            FROM
                                (SELECT COALESCE(CONVERT(VARCHAR(10),event_type), 'Total') Event_type, COUNT(DISTINCT visit_id)  #Visits 
                                FROM events e
                                GROUP BY ROLLUP(event_type)) Q
                        -- Pivoting
                            PIVOT(
                                SUM(#Visits)
                                FOR [Event_type] IN(
                                    "1","2","3","4","5",
                                    [Total]
                                )
                            ) AS Pivot_Table)
                -- Main Query No need for Page View because all Page views were visits i.e. 100%
                    SELECT  CAST(([2]*100.0)/Total AS DEC(10,2)) AS [% Add to Cart Events], 
                            CAST(([3]*100.0)/Total AS DEC(10,2)) AS [% Purchase Events],
                            CAST(([4]*100.0)/Total AS DEC(10,2)) AS [% Ad Impression Events],
                            CAST(([5]*100.0)/Total AS DEC(10,2)) AS [% Ad Click Events]
                    FROM temp_CTE


        -- Using Subqueries
            SELECT event_type, CAST((#Visits*100.0)/#Total AS DEC(10,2)) AS [%Events]
            FROM    
                (SELECT DISTINCT event_type,
                    (SELECT COUNT(DISTINCT visit_id)
                    FROM events v 
                    WHERE v.event_type = e.event_type) AS #Visits,
                    (SELECT COUNT(DISTINCT visit_id)
                    FROM events) AS #Total
                FROM events e) Q    
```
   6. What is the percentage of visits which view the checkout page but do not have a purchase event?
          
```sql
        -- Using Subqueries
            SELECT CONCAT(CAST(#Visits * 100.0/#Total AS DEC(10,2)),'%') AS perc_visits
            FROM    
                (SELECT
                    (SELECT COUNT(*)
                     FROM events
                     WHERE page_id = 12 AND visit_id NOT IN (SELECT visit_id
                                                             FROM events
                                                             WHERE event_type = 3)) AS #Visits,
                    (SELECT COUNT(DISTINCT visit_id) 
                    FROM events) AS #Total) Q
            --
    
```
   7. What are the top 3 pages by number of views?
          
```sql
         -- Group By
            SELECT TOP 3 page_name, COUNT(DISTINCT visit_id) AS #Views
            FROM events e
            LEFT JOIN page_hierarchy p
            ON p.page_id = e.page_id
            GROUP BY page_name
            ORDER BY #Views DESC
        -- Window functions
            SELECT DISTINCT TOP 3 page_name, LAST_VALUE(#Views) OVER(PARTITION BY page_name ORDER BY page_name) #Views
            FROM
                (SELECT DISTINCT page_name, visit_id, DENSE_RANK() OVER(PARTITION BY page_name ORDER BY visit_id)  AS #Views
                FROM events e
                LEFT JOIN page_hierarchy p
                ON p.page_id = e.page_id) Q
            ORDER BY #Views DESC   
```
   8. What is the number of views and cart adds for each product category?
     
```sql
        -- Correlated subqueries
            SELECT DISTINCT p.product_category, 
                (SELECT COUNT(*)
                 FROM events v1
                 LEFT JOIN page_hierarchy ph
                 ON v1.page_id = ph.page_id
                 WHERE event_type = 1
                 AND p.product_category = ph.product_category) Views,
                (SELECT COUNT(*)
                 FROM events v
                 LEFT JOIN page_hierarchy ph
                 ON v.page_id = ph.page_id
                 WHERE event_type = 2
                 AND p.product_category = ph.product_category) Cart_Adds
            FROM page_hierarchy p
            WHERE product_category IS NOT NULL
            ORDER BY product_category

        -- Using Group BY
            WITH Views AS
                (SELECT product_category, COUNT(event_type) AS #views
                FROM events e
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE p.product_category IS NOT NULL
                AND event_type = 1
                GROUP BY product_category),
                Cart_Adds AS
                (SELECT product_category, COUNT(event_type) AS #cart_adds
                FROM events e
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE p.product_category IS NOT NULL
                AND event_type = 2
                GROUP BY product_category)

            SELECT v.product_category, #views, #cart_adds
            FROM Views v
            LEFT JOIN Cart_Adds c
            ON v.product_category = c.product_category    
``` 
   9. What are the top 3 products by purchases?
        
```sql
        SELECT TOP 3 page_name, COUNT(visit_id) AS #Purchases
        FROM events e
        LEFT JOIN page_hierarchy p
        ON e.page_id = p.page_id
        WHERE event_type = 2 
        AND visit_id IN (SELECT visit_id
                         FROM events 
                         WHERE event_type = 3)
        GROUP BY page_name
        ORDER BY #Purchases DESC    
```
    
## Product Funnel Analysis
   Using a single SQL query - create a new output table which has the following details:
   - How many times was each product viewed?
   - How many times was each product added to cart?
   - How many times was each product added to a cart but not purchased (abandoned)?
   - How many times was each product purchased?
   
```sql
        CREATE OR ALTER VIEW Product AS
        WITH 
            Views AS
                (SELECT COALESCE(CONVERT(VARCHAR(10),product_id),'Total') product_id, COUNT(*) #views
                FROM events e 
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE event_type = 1 AND product_id IS NOT NULL
                GROUP BY ROLLUP(product_id)),
            CartAdds AS
                (SELECT COALESCE(CONVERT(VARCHAR(10),product_id),'Total') product_id, COUNT(*) #cartadds
                FROM events e 
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE event_type = 2 AND product_id IS NOT NULL
                GROUP BY ROLLUP(product_id)),
            Abandons AS
                (SELECT COALESCE(CONVERT(VARCHAR(10),product_id),'Total') product_id, COUNT(*) #abandons
                FROM events e
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE visit_id NOT IN (SELECT DISTINCT visit_id
                                    FROM events  
                                    WHERE event_type = 3)
                AND event_type = 2 AND product_id IS NOT NULL 
                GROUP BY ROLLUP(product_id)),
            Purchased AS
                (SELECT COALESCE(CONVERT(VARCHAR(10),product_id),'Total') product_id, COUNT(visit_id) AS #purchased
                FROM events e
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE event_type = 2 
                AND visit_id IN (SELECT visit_id
                                FROM events 
                                WHERE event_type = 3)
                GROUP BY ROLLUP(product_id))
        
        SELECT COALESCE(page_name, 'Total') Name, v.product_id, #views, #cartadds, #abandons, #purchased
        FROM Views v
        LEFT JOIN CartAdds c
            ON v.product_id = c.product_id
        LEFT JOIN Abandons a
            ON v.product_id = a.product_id
        LEFT JOIN Purchased p
            ON v.product_id = p.product_id
        LEFT JOIN page_hierarchy ph
            ON v.product_id = CONVERT(VARCHAR(10),ph.product_id)    
```
   Additionally, create another table which further aggregates the data for the above points but this time for each product category instead of individual products.
   
```sql
        WITH 
            Views AS
                (SELECT COALESCE(CONVERT(VARCHAR(10),product_category),'Total') product_category, COUNT(*) #views
                FROM events e 
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE event_type = 1 AND product_category IS NOT NULL
                GROUP BY ROLLUP(product_category)),
            CartAdds AS
                (SELECT COALESCE(CONVERT(VARCHAR(10),product_category),'Total') product_category, COUNT(*) #cartadds
                FROM events e 
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE event_type = 2 AND product_category IS NOT NULL
                GROUP BY ROLLUP(product_category)),
            Abandons AS
                (SELECT COALESCE(CONVERT(VARCHAR(10),product_category),'Total') product_category, COUNT(*) #abandons
                FROM events e
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE visit_id NOT IN (SELECT DISTINCT visit_id
                                    FROM events  
                                    WHERE event_type = 3)
                AND event_type = 2 AND product_category IS NOT NULL 
                GROUP BY ROLLUP(product_category)),
            Purchased AS
                (SELECT COALESCE(CONVERT(VARCHAR(10),product_category),'Total') product_category, COUNT(visit_id) AS #purchased
                FROM events e
                LEFT JOIN page_hierarchy p
                ON e.page_id = p.page_id
                WHERE event_type = 2 
                AND visit_id IN (SELECT visit_id
                                FROM events 
                                WHERE event_type = 3)
                GROUP BY ROLLUP(product_category))
        
        SELECT COALESCE(v.product_category, 'Total') Name, #views, #cartadds, #abandons, #purchased
        FROM Views v
        LEFT JOIN CartAdds c
            ON v.product_category = c.product_category
        LEFT JOIN Abandons a
            ON v.product_category = a.product_category
        LEFT JOIN Purchased p
            ON v.product_category = p.product_category    
```
    
   - Use your 2 new output tables - answer the following questions:
   
   1. Which product had the most views, cart adds and purchases?
   
```sql
        SELECT DISTINCT
            (SELECT Name FROM Product WHERE #views = (SELECT MAX(#views) FROM Product WHERE Name NOT IN ('Total'))) [Most Views],
            (SELECT Name FROM Product WHERE #cartadds = (SELECT MAX(#cartadds) FROM Product WHERE Name NOT IN ('Total'))) [Most Cart Adds],
            (SELECT Name FROM Product WHERE #purchased = (SELECT MAX(#purchased) FROM Product WHERE Name NOT IN ('Total'))) [Most Purchased]
        FROM Product    
```
   2. Which product was most likely to be abandoned?
   
```sql
        SELECT Name
        FROM Product
        WHERE #abandons = (SELECT MAX(#abandons)
                           FROM Product
                           WHERE Name NOT IN ('Total'))    
```
   3. Which product had the highest view to purchase percentage?
   
```sql
        SELECT TOP 1 Name, CAST(#purchased * 100.0/#views AS DEC(10,2)) AS [perc_view_purchase]
        FROM Product
        WHERE Name <> 'Total'
        ORDER BY [perc_view_purchase] DESC    
```
   4. What is the average conversion rate from view to cart add?
   
```sql
        SELECT AVG([view_addcart_ rate]) AS Avg_conversion_rate
        FROM
            (SELECT Name, CAST(#cartadds * 100.0/#views AS DEC(10,2)) AS [view_addcart_ rate]
            FROM Product) Q 
```
   5. What is the average conversion rate from cart add to purchase?
   
```sql
        SELECT AVG([addcart_purchase_rate]) AS Avg_conversion_rate
        FROM
            (SELECT Name, CAST(#purchased * 100.0/#cartadds AS DEC(10,2)) AS [addcart_purchase_rate]
            FROM Product) Q    
```
## Product Analysis
   
   Generate a table that has 1 single row for every unique visit_id record and has the following columns:
   - user_id
   - visit_id
   - visit_start_time: the earliest event_time for each visit
   - page_views: count of page views for each visit
   - cart_adds: count of product cart add events for each visit
   - purchase: 1/0 flag if a purchase event exists for each visit
   - campaign_name: map the visit to a campaign if the visit_start_time falls between the start_date and end_date
   - impression: count of ad impressions for each visit
   - click: count of ad clicks for each visit
   - (Optional column) cart_products: a comma separated text value with products added to the cart sorted by the order they were added to the cart (hint: use the sequence_number)
  
```sql
     SELECT DISTINCT user_id, visit_id, 
           MIN(e.event_time) OVER(PARTITION BY visit_id) visit_start_time,
           COUNT(e.page_id) OVER(PARTITION BY visit_id) page_views,
           (SELECT COUNT(v.page_id) FROM events v
             LEFT JOIN page_hierarchy ph ON v.page_id = ph.page_id
             WHERE ph.product_category IS NOT NULL
             AND v.event_type = 2
             AND e.visit_id = v.visit_id) AS cart_adds,
           CASE WHEN (SELECT COUNT(*) FROM events n WHERE n.event_type = 3 AND e.visit_id = n.visit_id) >= 1 THEN 1
                ELSE 0
            END AS Purchase,
           campaign_name,
           (SELECT COUNT(*)
            FROM events t
            WHERE t.event_type = 4
            AND e.visit_id = t.visit_id) AS impression,
           (SELECT COUNT(*)
            FROM events t
            WHERE t.event_type = 5
            AND e.visit_id = t.visit_id) AS click,
           (SELECT STRING_AGG(page_name,',') AS cart
            FROM events s
            LEFT JOIN page_hierarchy ph ON s.page_id = ph.page_id
            WHERE ph.product_category IS NOT NULL
            AND s.event_type = 2
            AND s.visit_id = e.visit_id) AS cart_products
    FROM events e
    LEFT JOIN users u 
    ON e.cookie_id = u.cookie_id
    LEFT JOIN campaign_identifier c
    ON e.event_time BETWEEN c.start_date AND c.end_date
    LEFT JOIN page_hierarchy p
    ON e.page_id = p.page_id
   
```
  
  </p>
  </details>

