# 8-Week SQL Challenge

Case Study #1 - Danny's Diner
https://8weeksqlchallenge.com/case-study-1/

![image](https://user-images.githubusercontent.com/99233674/199024658-a1b34542-46a8-442f-913b-6b44e31cf79c.png)

# 📕 Table of Contents
- 🛠️ Problem Statement
- 📂 Dataset
- 🧙‍ Case Study Questions
- 🚀 Solutions

# 🛠️ Problem Statement
> Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

> He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.

> Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!

# 📂 Dataset
This case study has 3 key datasets 
- sales
- menu
- members





# 🧙‍♂️Case Study Questions
Each of the following case study questions can be answered using a single SQL statement:

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

## Bonus Questions
> Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.


# 🚀 Solutions


1. Total amount spent by each customer

```
    --Using Joins
        SELECT s.customer_id, SUM(m.price) AS [Amount Spent]
        FROM sales s
        LEFT JOIN menu m
        ON m.product_id = s.product_id
        GROUP BY s.customer_id

    --Alternatively - Using Correlated Subquery
        SELECT  DISTINCT  s1.customer_id, 
                (SELECT SUM(m.price)
                FROM menu m, sales s2
                WHERE s1.customer_id = s2.customer_id AND s2.product_id = m.product_id) AS [Amount Spent]
        FROM sales s1

    --Alternatively - Using Window Functions
        SELECT DISTINCT s.customer_id,
                SUM(m.price) OVER(PARTITION BY s.customer_id) AS [Amount Spent]
        FROM sales s
        LEFT JOIN menu m
        ON m.product_id = s.product_id
        ORDER BY [Amount Spent] DESC
```

2. Days each customer visited the restaurant

```
    --Using Nested subquery
        SELECT s.customer_id, 
               COUNT(order_date)  AS [Number of Days]
        FROM sales s
        GROUP BY s.customer_id
    --Using correlated subquery
        SELECT DISTINCT  s.customer_id,
                (SELECT COUNT(DISTINCT s1.order_date)
                 FROM sales s1
                 WHERE s.customer_id = s1.customer_id) AS [Number of Days]
        FROM sales s
```

3. First item from the menu purchased by each customer

```
    --Using Joins
        SELECT DISTINCT s.customer_id, m.product_name
        FROM sales s
        LEFT JOIN menu m
        ON m.product_id = s.product_id
        LEFT JOIN (SELECT DISTINCT customer_id, 
                        MIN(order_date) OVER(PARTITION BY customer_id) AS min_order_date
                    FROM sales) AS sq
        ON s.customer_id = sq.customer_id
        WHERE s.order_date = sq.min_order_date

    --Using correlated subqueries
        SELECT DISTINCT s.customer_id, m.product_name
        FROM sales s
        LEFT JOIN menu m
        ON s.product_id = m.product_id
        WHERE s.order_date = (SELECT MIN(order_date)
                              FROM sales s1
                              WHERE s.customer_id = s1.customer_id)
        ORDER BY s.customer_id, m.product_name
```
4. Most purchased item and number of times it was purchased

```
    --Using Window Functions
        SELECT sq.product_name,sq.[Number of Orders], RANK() OVER(ORDER BY sq.[Number of Orders] DESC) AS Rank
        FROM
            (SELECT DISTINCT m.product_name, COUNT(s.product_id) OVER(PARTITION BY s.product_id) AS [Number of Orders]
             FROM sales s
             LEFT JOIN menu m
             ON s.product_id = m.product_id) AS sq

    --Using Correlated Subquery
        SELECT *, RANK() OVER(ORDER BY sq.[Number of Orders] DESC) AS Rank  
        FROM    
            (SELECT  m.product_name, 
                    (SELECT COUNT(s.product_id)
                     FROM sales s
                     WHERE m.product_id = s.product_id) AS [Number of Orders]
            FROM menu m) as sq

```

5. Most popular item for each customer

```
    --Using Window Functions
    
        SELECT *
        FROM    
            (SELECT DISTINCT sq.customer_id, sq.product_name, sq.[Number of Orders], RANK() OVER(PARTITION BY sq.customer_id ORDER BY sq.[Number of Orders] DESC) AS Ranking
            FROM    (SELECT DISTINCT s.customer_id, m.product_name, COUNT(s.product_id) OVER(PARTITION BY s.customer_id, m.product_name) AS [Number of Orders]
                    FROM sales s
                    LEFT JOIN menu m
                    ON s.product_id = m.product_id) AS sq) AS q
        WHERE q.Ranking = 1



    --Using Correlated Subquery
        SELECT DISTINCT s.customer_id, m.product_name, 
                (SELECT COUNT(s1.product_id)
                 FROM sales s1
                 WHERE s.product_id = s1.product_id AND s.customer_id = s1.customer_id) AS [Number of Orders]
        FROM sales s 
        LEFT JOIN menu m
        ON m.product_id = s.product_id
```

6. First item purchased after becoming a member

```
    --Using correlated subquery method
        SELECT DISTINCT sq.customer_id, sq.date_diff, m.product_name
        FROM
            (SELECT s.customer_id, DATEDIFF("DAY",me.join_date,s.order_date) AS date_diff, s.product_id
            FROM members me
            LEFT JOIN sales s
            ON me.customer_id = s.customer_id
            WHERE DATEDIFF("DAY",me.join_date,s.order_date) >= 0) AS sq
        LEFT JOIN menu m
        ON m.product_id = sq.product_id
        WHERE sq.date_diff = (SELECT DISTINCT MIN(DATEDIFF("DAY",m1.join_date,s1.order_date)) OVER(PARTITION BY s1.customer_id)
                              FROM members m1
                              LEFT JOIN sales s1
                              ON m1.customer_id =  s1.customer_id
                              WHERE DATEDIFF("DAY",m1.join_date,s1.order_date) >= 0 AND s1.customer_id = sq.customer_id )

    --Alternatively
            SELECT s.customer_id, s.product_id, m.product_name, s.order_date, DATEDIFF("DAY",me.join_date,s.order_date)
            FROM members me
            LEFT JOIN sales s
            ON me.customer_id = s.customer_id
            LEFT JOIN menu m
            ON s.product_id = m.product_id
            WHERE DATEDIFF("DAY",me.join_date,s.order_date) >= 0 AND  DATEDIFF("DAY",me.join_date,s.order_date) = (SELECT DISTINCT MIN(DATEDIFF("DAY",m1.join_date,s1.order_date)) OVER(PARTITION BY s1.customer_id)
                                                                                                                   FROM members m1
                                                                                                                   LEFT JOIN sales s1
                                                                                                                   ON m1.customer_id =  s1.customer_id
                                                                                                                   WHERE DATEDIFF("DAY",m1.join_date,s1.order_date) >= 0 AND s1.customer_id = s.customer_id )
    --Alternatively
            SELECT *
            FROM
                (SELECT s.customer_id, s.product_id, m.product_name, s.order_date, RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date) AS List
                FROM members me
                LEFT JOIN sales s
                ON me.customer_id = s.customer_id
                LEFT JOIN menu m
                ON s.product_id = m.product_id
                WHERE s.order_date >= me.join_date) AS sq
            WHERE sq.List = 1
```

7. Last item purchased just before becoming a member

```
    -- One Method
        SELECT DISTINCT sq.customer_id, m.product_name
        FROM
            (SELECT s.customer_id, DATEDIFF("DAY",me.join_date,s.order_date) AS date_diff, s.product_id
            FROM members me
            LEFT JOIN sales s
            ON me.customer_id = s.customer_id
            WHERE DATEDIFF("DAY",me.join_date,s.order_date) < 0) AS sq
        LEFT JOIN menu m
        ON m.product_id = sq.product_id
        WHERE sq.date_diff = (SELECT DISTINCT MAX(DATEDIFF("DAY",m1.join_date,s1.order_date)) OVER(PARTITION BY s1.customer_id)
                              FROM members m1
                              LEFT JOIN sales s1
                              ON m1.customer_id =  s1.customer_id
                              WHERE DATEDIFF("DAY",m1.join_date,s1.order_date) < 0 AND s1.customer_id = sq.customer_id )

    -- Alternatively:
        SELECT me.customer_id, mn.product_name, DATEDIFF("DAY",me.join_date,s.order_date)
        FROM members me
        LEFT JOIN sales s
        ON s.customer_id = me.customer_id
        LEFT JOIN menu mn
        ON mn.product_id = s.product_id
        WHERE DATEDIFF("DAY",me.join_date,s.order_date) = (SELECT DISTINCT MAX(DATEDIFF("DAY",m1.join_date,s1.order_date)) OVER(PARTITION BY s1.customer_id)
                                                          FROM members m1
                                                          LEFT JOIN sales s1
                                                          ON m1.customer_id =  s1.customer_id
                                                          WHERE DATEDIFF("DAY",m1.join_date,s1.order_date) < 0 AND s1.customer_id = s.customer_id )

    --Alternatively
            SELECT *
            FROM
                (SELECT s.customer_id, s.product_id, m.product_name, s.order_date, RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date DESC) AS List
                FROM members me
                LEFT JOIN sales s
                ON me.customer_id = s.customer_id
                LEFT JOIN menu m
                ON s.product_id = m.product_id
                WHERE s.order_date < me.join_date) AS sq
            WHERE sq.List = 1
```

Q8. Total items and amount spent for each member before becoming a member

```
    --Using Joins and Window Functions
        SELECT DISTINCT s.customer_id, m.product_name, 
               SUM(m.price) OVER(PARTITION BY m.product_name, s.customer_id) AS [Total Cost]
        FROM members me
        LEFT JOIN sales s
        ON me.customer_id = s.customer_id
        LEFT JOIN menu m
        ON s.product_id = m.product_id
        WHERE DATEDIFF("DAY",me.join_date,s.order_date) < 0

    --Using Joins and Group BY
        SELECT DISTINCT s.customer_id, m.product_name, SUM(m.price) AS [Total Cost]
        FROM members me
        LEFT JOIN sales s
        ON me.customer_id = s.customer_id
        LEFT JOIN menu m
        ON s.product_id = m.product_id
        WHERE me.join_date > s.order_date
        GROUP BY m.product_name, s.customer_id

    --Using Correlated subqueries
        SELECT DISTINCT me.customer_id, mn.product_name ,(SELECT SUM(m.price) 
                                                          FROM sales s
                                                          LEFT JOIN menu m
                                                          ON s.product_id = m.product_id
                                                          WHERE me.customer_id = s.customer_id AND mn.product_name = m.product_name
                                                          AND DATEDIFF("DAY",me.join_date,s.order_date) < 0)
        FROM  members me
        LEFT JOIN sales s1
        ON me.customer_id = s1.customer_id
        LEFT JOIN menu mn
        ON mn.product_id = s1.product_id
```

9. $1 = 10 points and sushi = 2x multiplier calculate each members points

```
    --Using Case statements
        SELECT sq.customer_id, SUM(sq.price * sq.multiplier * 10) AS Points  
        FROM
            (SELECT s.customer_id, mn.product_name, mn.price,
                    CASE 
                        WHEN [product_name] = 'sushi' THEN 2   
                        ELSE 1
                    END AS multiplier
            FROM sales s
            LEFT JOIN menu mn
            ON s.product_id = mn.product_id) AS sq
        GROUP BY sq.customer_id
```

10. 2x on all items in the first week of joining

```
    --Using case statements
        SELECT sq.customer_id, SUM(sq.price * sq.[membership multiplier] * 10) AS Points  
        FROM
            (SELECT s.customer_id, mn.product_name, mn.price, s.order_date,
                    CASE 
                        WHEN [product_name] = 'sushi'AND DATENAME("month",s.order_date) = 'January'  THEN 2   -- use single quotes with case statements
                        ELSE 1
                    END AS multiplier,
                    CASE 
                        WHEN s.order_date BETWEEN me.join_date AND DATEADD("Week",1,me.join_date) THEN 2
                        ELSE 1
                    END AS [membership multiplier]
            FROM sales s
            LEFT JOIN menu mn
            ON s.product_id = mn.product_id
            LEFT JOIN members me
            ON me.customer_id = s.customer_id
            ) AS sq
        GROUP BY sq.customer_id
```

- Bonus Questions

```
    -- CREATE VIEW [Total] AS
    SELECT s.customer_id, s.order_date, mn.product_name, mn.price, 
            CASE
                WHEN s.order_date >= me.join_date THEN 'Y'
                ELSE 'N'
            END AS [member]
    -- INTO FullTable
    FROM sales s
    LEFT JOIN menu mn
    ON mn.product_id = s.product_id
    LEFT JOIN members me
    ON me.customer_id = s.customer_id;
```
