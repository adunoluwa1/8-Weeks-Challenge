/*
--          Database Creation                   */
    -- CREATE DATABASE pizza_runner; 

/*
--          Table Creation                      */
    -- Runners Table
        -- DROP TABLE IF EXISTS runners;
        -- CREATE TABLE runners (
        --   "runner_id" INTEGER,
        --   "registration_date" DATE
        -- );
        -- INSERT INTO runners
        --   ("runner_id", "registration_date")
        -- VALUES
        --   (1, '2021-01-01'),
        --   (2, '2021-01-03'),
        --   (3, '2021-01-08'),
        --   (4, '2021-01-15');

    -- Customer Orders Table
        -- DROP TABLE IF EXISTS customer_orders;
        -- CREATE TABLE customer_orders (
        --   "order_id" INTEGER,
        --   "customer_id" INTEGER,
        --   "pizza_id" INTEGER,
        --   "exclusions" VARCHAR(4),
        --   "extras" VARCHAR(4),
        --   "order_time" DATETIME--TIMESTAMP  -- Changed Timestamp to DateTime Data Type
        -- );

        -- INSERT INTO customer_orders
        --   ("order_id", "customer_id", "pizza_id", "exclusions", "extras", "order_time")
        -- VALUES
        --   ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
        --   ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
        --   ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
        --   ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
        --   ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
        --   ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
        --   ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
        --   ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
        --   ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
        --   ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
        --   ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
        --   ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
        --   ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
        --   ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');

    -- Runner Orders Table
        -- DROP TABLE IF EXISTS runner_orders;
        -- CREATE TABLE runner_orders (
        --   "order_id" INTEGER,
        --   "runner_id" INTEGER,
        --   "pickup_time" VARCHAR(19),
        --   "distance" VARCHAR(7),
        --   "duration" VARCHAR(10),
        --   "cancellation" VARCHAR(23)
        -- );

        -- INSERT INTO runner_orders
        --   ("order_id", "runner_id", "pickup_time", "distance", "duration", "cancellation")
        -- VALUES
        --   ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
        --   ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
        --   ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
        --   ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
        --   ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
        --   ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
        --   ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
        --   ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
        --   ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
        --   ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');

    -- Pizza names Table
        -- DROP TABLE IF EXISTS pizza_names;
        -- CREATE TABLE pizza_names (
        --   "pizza_id" INTEGER,
        --   "pizza_name" TEXT
        -- );
        -- INSERT INTO pizza_names
        --   ("pizza_id", "pizza_name")
        -- VALUES
        --   (1, 'Meatlovers'),
        --   (2, 'Vegetarian');

    -- Pizza Recipes Table
        -- DROP TABLE IF EXISTS pizza_recipes;
        -- CREATE TABLE pizza_recipes (
        --   "pizza_id" INTEGER,
        --   "toppings" TEXT
        -- );
        -- INSERT INTO pizza_recipes
        --   ("pizza_id", "toppings")
        -- VALUES
        --   (1, '1, 2, 3, 4, 5, 6, 8, 10'),
        --   (2, '4, 6, 7, 9, 11, 12');


    -- Pizza Toppings Table
        -- DROP TABLE IF EXISTS pizza_toppings;
        -- CREATE TABLE pizza_toppings (
        --   "topping_id" INTEGER,
        --   "topping_name" TEXT
        -- );
        -- INSERT INTO pizza_toppings
        --   ("topping_id", "topping_name")
        -- VALUES
        --   (1, 'Bacon'),
        --   (2, 'BBQ Sauce'),
        --   (3, 'Beef'),
        --   (4, 'Cheese'),
        --   (5, 'Chicken'),
        --   (6, 'Mushrooms'),
        --   (7, 'Onions'),
        --   (8, 'Pepperoni'),
        --   (9, 'Peppers'),
        --   (10, 'Salami'),
        --   (11, 'Tomatoes'),
        --   (12, 'Tomato Sauce');



/*
--          Select Tables                       */
    SELECT * FROM runners
    SELECT * FROM customer_orders
    SELECT * FROM runner_orders
    SELECT * FROM pizza_names
    SELECT * FROM pizza_recipes
    SELECT * FROM pizza_toppings


/*
--          Data Cleanup                        */
    -- Customer Orders Table
        UPDATE customer_orders
        SET exclusions = NULL
        WHERE exclusions LIKE '%null%' OR exclusions = ''

        UPDATE customer_orders
        SET extras = NULL
        WHERE extras LIKE '%null%' OR extras = ''

    -- Runner Orders Table
        -- Set Null values
            UPDATE runner_orders
            SET pickup_time = NULL, distance = NULL, duration = NULL
            WHERE cancellation LIKE '%Cancellation%';


            UPDATE runner_orders
            SET cancellation = NULL
            WHERE cancellation NOT LIKE '%Cancellation%'
        -- Removed km and minute symbols
            UPDATE runner_orders
            SET distance = TRIM(SUBSTRING(distance,1,CHARINDEX('k',distance)-1))
            WHERE distance LIKE '%km%'

            UPDATE runner_orders
            SET duration = TRIM(SUBSTRING(duration,1,CHARINDEX('m',duration)-1))
            WHERE duration LIKE '%min%'
        -- Changed Data Type
            ALTER TABLE runner_orders
            ALTER COLUMN distance DEC(24,1)
            
            ALTER TABLE runner_orders
            ALTER COLUMN duration DEC(24,1)
    
    -- Pizza Name Table
        ALTER TABLE pizza_names
        ALTER COLUMN pizza_name VARCHAR(30)
    
    -- Pizza Recipes
        ALTER TABLE pizza_recipes
        ALTER COLUMN toppings VARCHAR(30)
    
    -- Pizza Toppings
        ALTER TABLE pizza_toppings
        ALTER COLUMN topping_name VARCHAR(30)

/*
--          Q1.Pizza Metrics                    */
    -- 1. How many pizzas were ordered?
        SELECT COUNT(*) AS [Number of Orders]
        FROM customer_orders

    -- 2. How many unique customer orders were made?
        SELECT COUNT(*) AS [Number of Distinct Orders]
        FROM (SELECT DISTINCT * 
              FROM customer_orders) AS sq
    -- 3. How many successful orders were delivered by each runner?
        -- Using Group By
            SELECT runner_id, COUNT (order_id) AS [Successful Orders]
            FROM runner_orders
            WHERE cancellation IS NULL
            GROUP BY runner_id

        -- Using window function
            SELECT DISTINCT runner_id, COUNT(order_id) OVER(PARTITION BY runner_id) AS [Successful Orders]
            FROM runner_orders
            WHERE cancellation IS NULL

        -- Using correlated subqueries
            SELECT DISTINCT runner_id, (SELECT COUNT(*)
                               FROM runner_orders ro
                               WHERE ro.runner_id = r.runner_id AND ro.cancellation IS NULL)  AS [Successful Orders]
            FROM runner_orders r
    
    -- 4. How many of each type of pizza was delivered?
        -- Using Group BY
            SELECT c.pizza_id, 
                   COUNT(c.order_id) AS [# of Pizza Delivered]
            FROM customer_orders c
            LEFT JOIN runner_orders r
            ON c.order_id = r.order_id
            WHERE cancellation IS NULL
            GROUP BY c.pizza_id

        -- Using window functions
            SELECT DISTINCT c.pizza_id,
                            COUNT(c.order_id) OVER(PARTITION BY c.pizza_id)  AS [# of Pizza Delivered]
            FROM customer_orders c
            LEFT JOIN runner_orders r
            ON c.order_id = r.order_id
            WHERE r.cancellation IS NULL

        -- Using correlated subqueries
            SELECT DISTINCT c.pizza_id, (SELECT COUNT(co.order_id)
                                         FROM customer_orders co
                                         LEFT JOIN runner_orders r
                                         ON co.order_id=r.order_id
                                         WHERE co.pizza_id = c.pizza_id
                                         AND r.cancellation IS NULL) AS [# of Pizza Delivered]
            FROM customer_orders c
    -- 5. How many Vegetarian and Meatlovers were ordered by each customer?
        -- Using Group By
            SELECT p.pizza_name, COUNT(c.order_id) AS [Number of Orders]
            FROM customer_orders c
            LEFT JOIN pizza_names p
            ON p.pizza_id = c.pizza_id
            GROUP BY p.pizza_name

        -- Using window functions
            SELECT DISTINCT p.pizza_name, COUNT(c.order_id) OVER(PARTITION BY p.pizza_name) AS [Number of Orders]
            FROM customer_orders c
            LEFT JOIN pizza_names p
            ON p.pizza_id = c.pizza_id

        -- Using correlated subqueries
            SELECT DISTINCT p.pizza_name, (SELECT COUNT(*)
                                           FROM customer_orders c
                                           LEFT JOIN pizza_names pn
                                           ON pn.pizza_id = c.pizza_id
                                           WHERE p.pizza_name = pn.pizza_name)
                                           AS [Number of Orders]
            FROM pizza_names p

    -- 6. What was the maximum number of pizzas delivered in a single order?
        -- Using Group By
            SELECT q.order_id, q.[Number of Pizzas]
            FROM
                (SELECT *, RANK() OVER(ORDER BY sq.[Number of Pizzas] DESC) AS Ranking
                FROM 
                    (SELECT c.order_id, COUNT(*) AS [Number of Pizzas]
                    FROM customer_orders c
                    LEFT JOIN runner_orders r
                    ON c.order_id = r.order_id
                    WHERE r.cancellation IS NULL
                    GROUP BY c.order_id) AS sq) AS q
            WHERE q.Ranking = 1
            
        -- Using Window Functions
            SELECT q.order_id, q.[Number of Pizzas]
            FROM
                (SELECT *, RANK() OVER(ORDER BY sq.[Number of Pizzas] DESC) AS Ranking
                FROM
                    (SELECT DISTINCT c.order_id, COUNT(*) OVER(PARTITION BY c.order_id) AS [Number of Pizzas]
                    FROM customer_orders c
                    LEFT JOIN runner_orders r
                    ON c.order_id = r.order_id
                    WHERE r.cancellation IS NULL) AS sq) AS q
            WHERE q.Ranking = 1

        -- Using Subqueries in WHERE clause & Order view
            CREATE VIEW Orders AS 
                SELECT c.order_id,
                    c.customer_id,
                    c.pizza_id,
                    c.order_time,
                    c.exclusions,
                    r.runner_id,
                    r.pickup_time,
                    r.distance,
                    r.duration,
                    r.cancellation
                FROM customer_orders c
                LEFT JOIN runner_orders r
                ON c.order_id = r.order_id
            
            --
            SELECT *
            FROM
                (SELECT order_id, COUNT(customer_id) AS [#]
                FROM Orders o
                WHERE cancellation IS NULL
                GROUP BY order_id) AS q
            WHERE q.# = (SELECT MAX(s.count) AS [Count]
                         FROM (SELECT o1.order_id, COUNT(o1.customer_id) AS [Count]
                               FROM Orders o1
                               GROUP BY o1.order_id) AS s)
            

    -- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
        -- Using Group By
            SELECT DISTINCT c.customer_id, COUNT(*) AS [One Change]
            FROM customer_orders c
            LEFT JOIN runner_orders r
            ON c.order_id = r.order_id
            WHERE (c.exclusions IS NULL OR c.extras IS NULL) 
            AND r.cancellation IS NULL
            GROUP BY c.customer_id

            SELECT DISTINCT c.customer_id, COUNT(*) AS [No Change]
            FROM customer_orders c
            LEFT JOIN runner_orders r
            ON c.order_id = r.order_id
            WHERE c.exclusions IS NULL AND c.extras IS NULL 
            AND r.cancellation IS NULL
            GROUP BY c.customer_id

        -- Using window functions
            SELECT DISTINCT c.customer_id, COUNT(*) OVER(PARTITION BY c.customer_id) AS [One Change]
            FROM customer_orders c
            LEFT JOIN runner_orders r
            ON c.order_id = r.order_id
            WHERE (c.exclusions IS NULL OR c.extras IS NULL)
            AND r.cancellation IS NULL

            SELECT DISTINCT c.customer_id, COUNT(*) OVER(PARTITION BY c.customer_id) AS [No Change]
            FROM customer_orders c
            LEFT JOIN runner_orders r
            ON c.order_id = r.order_id
            WHERE c.exclusions IS NULL AND c.extras IS NULL 
            AND r.cancellation IS NULL
        -- Using Correlated Subqueries
            SELECT DISTINCT co.customer_id, (SELECT COUNT(c1.order_id)
                                            FROM customer_orders c1 
                                            LEFT JOIN runner_orders r1
                                            ON c1.order_id = r1.order_id
                                            WHERE r1.cancellation IS NULL
                                            AND co.customer_id = c1.customer_id
                                            AND (c1.exclusions IS NULL OR c1.extras IS NULL)) AS [One Change],
                                            (SELECT COUNT(c2.order_id)
                                            FROM customer_orders c2 
                                            LEFT JOIN runner_orders r2
                                            ON c2.order_id = r2.order_id
                                            WHERE c2.exclusions IS NULL AND c2.extras IS NULL
                                            AND c2.customer_id = co.customer_id
                                            AND r2.cancellation IS NULL) AS [No Change]
            FROM customer_orders co
    

    -- 8. How many pizzas were delivered that had both exclusions and extras?
        -- Using Group By
            SELECT DISTINCT c.customer_id, COUNT(*) AS [No Change]
            FROM customer_orders c
            LEFT JOIN runner_orders r
            ON c.order_id = r.order_id
            WHERE c.exclusions IS NOT NULL AND c.extras IS NOT NULL 
            AND r.cancellation IS NULL
            GROUP BY c.customer_id

        -- Using window functions
            SELECT DISTINCT c.customer_id, COUNT(*) OVER(PARTITION BY c.customer_id) AS [No Change]
            FROM customer_orders c
            LEFT JOIN runner_orders r
            ON c.order_id = r.order_id
            WHERE c.exclusions IS NOT NULL AND c.extras IS NOT NULL 
            AND r.cancellation IS NULL

        --using correlated subqueries
            SELECT DISTINCT co.customer_id, (SELECT COUNT(c2.order_id)
                                            FROM customer_orders c2 
                                            LEFT JOIN runner_orders r2
                                            ON c2.order_id = r2.order_id
                                            WHERE c2.exclusions IS NOT NULL AND c2.extras IS NOT NULL
                                            AND c2.customer_id = co.customer_id
                                            AND r2.cancellation IS NULL) AS [No Change]
            FROM customer_orders co
    
    -- 9. What was the total volume of pizzas ordered for each hour of the day?
            -- For future reference https://www.w3schools.com/sql/func_sqlserver_datepart.asp
            -- DATEPART returns int
        -- Using group By
            SELECT DATEPART(hh, c.order_time) AS [Time], COUNT(*) AS [Volume Ordered]
            FROM customer_orders c
            GROUP BY DATEPART(hh, c.order_time)

        -- Using window functions
            SELECT DISTINCT DATEPART(hh, c.order_time) AS [Time],
                            COUNT(*) OVER(PARTITION BY DATEPART(hh, c.order_time)) AS [Volume Ordered]
            FROM customer_orders c

        -- Using correlated subqueries in SELECT statement
            SELECT DISTINCT DATEPART(hh, c.order_time) AS [Time], 
                   (SELECT COUNT(*)
                   FROM customer_orders co
                   WHERE DATEPART(hh, c.order_time) = DATEPART(hh, co.order_time)) AS [Volume Ordered]
            FROM customer_orders c


    -- 10.What was the volume of orders for each day of the week?
            -- For future reference https://www.w3schools.com/sql/func_sqlserver_datename.asp
            -- DATENAME return str
            -- w = wd = WEEKDAY
        -- Using group By 
            SELECT DATENAME(w, c.order_time) AS [Day], COUNT(*) AS [Volume Ordered]
            FROM customer_orders c
            GROUP BY DATENAME(w, c.order_time)

        -- Using window functions
            SELECT DISTINCT DATENAME(dw, c.order_time) AS [Day],
                            COUNT(*) OVER(PARTITION BY DATENAME(dw, c.order_time)) AS [Volume Ordered]
            FROM customer_orders c

        -- Using correlated subqueries in SELECT statement and WEEKDAY interval 
            SELECT DISTINCT DATENAME(WEEKDAY, c.order_time) AS [Day], 
                   (SELECT COUNT(*)
                   FROM customer_orders co
                   WHERE DATENAME(WEEKDAY, c.order_time) = DATENAME(WEEKDAY, co.order_time)) AS [Volume Ordered]
            FROM customer_orders c




/*
--          Q2.Runner and Customer Experience   */
    -- 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
        -- Using Group BY 
            --DATEPART & DATENAME both apply
            SELECT DATEPART(ww,registration_date) AS [Week], COUNT(*) AS [# of Registrants]
            FROM runners
            GROUP BY DATEPART(ww,registration_date)

        -- Using Window functions
            SELECT DISTINCT DATEPART(ww,registration_date) AS [Week],
                            COUNT(*) OVER(PARTITION BY DATEPART(ww,registration_date)) AS [# of Registrants]
            FROM runners

        -- Using correlated subqueries
            SELECT DISTINCT DATEPART(ww, rn.registration_date) AS [Week], 
            (SELECT COUNT(*) FROM runners r
             WHERE DATEPART(ww, rn.registration_date) = DATEPART(ww, r.registration_date)) AS [# of Registrants]
            FROM runners rn
            WHERE rn.registration_date = registration_date


    -- 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
        -- Using Group By
            SELECT runner_id, ROUND(AVG(DATEDIFF(s,order_time,pickup_time)/60.0),2) AS [Avg Arrival Time]
            FROM Orders
            GROUP BY runner_id

        -- Using window functions without rounding
            SELECT DISTINCT runner_id, AVG(DATEDIFF(n,order_time,pickup_time)) OVER(PARTITION BY runner_id) AS [Avg Arrival Time]
            FROM Orders
        -- Using corrlated sub queries
            SELECT DISTINCT o.runner_id, (SELECT ROUND(AVG(DATEDIFF(s,s.order_time,s.pickup_time)/60.0),2)
                                          FROM Orders s
                                          WHERE s.runner_id = o.runner_id) AS [Avg Arrival Time]
            FROM Orders o
    -- 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
        -- Test method
            SELECT order_id, COUNT(*) AS [# of Orders], AVG(DATEDIFF(n,order_time, pickup_time)) AS [Preparation Time]
            FROM Orders
            WHERE cancellation IS NULL
            GROUP BY order_id

        -- Using correlated sub queries
            SELECT DISTINCT o.order_id, 
                   (SELECT COUNT(*)
                   FROM Orders s
                   WHERE o.order_id = s.order_id) AS [# of Pizzas],
                   (SELECT AVG(DATEDIFF(n,r.order_time,r.pickup_time))
                   FROM Orders r
                   WHERE o.order_id = r.order_id) AS [Preparation Time]
            FROM Orders o
            WHERE o.cancellation IS NULL

    -- 4. What was the average distance travelled for each customer?
        -- Using Group By
            SELECT customer_id, AVG(distance) AS [Avg Distance]
            FROM Orders
            WHERE cancellation IS NULL
            GROUP BY customer_id
            -- SELECT * FROM Orders
        -- Using Window Functions
            SELECT DISTINCT customer_id, AVG(distance) OVER(PARTITION BY customer_id) AS [Avg Distance]
            FROM Orders
            WHERE cancellation IS NULL
            
        -- Using Correlated Sub queries
            SELECT DISTINCT o.customer_id, 
            (SELECT AVG(Distance)
             FROM Orders s
             WHERE o.customer_id = s.customer_id
             AND s.cancellation IS NULL ) AS [Avg Distance]
            FROM Orders o
            

    -- 5. What was the difference between the longest and shortest delivery times for all orders?
            -- Using Normal
            SELECT  MAX(duration) - MIN(duration) AS [Delivery Range]
            FROM Orders
            -- SELECT * FROM Orders
    -- 6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
        -- Using all methods - no trends found
            SELECT runner_id, order_id, customer_id, CONVERT(DEC(10,2),AVG(distance/(duration/60))) AS [Speed (Km/hr)], AVG(distance) AS [Avg Distance],
            (SELECT COUNT(*)
             FROM Orders s
             WHERE o.order_id = s.order_id
             AND o.runner_id = s.runner_id
             AND s.cancellation IS NULL ) AS [#]
            FROM Orders o
            WHERE cancellation IS NULL
            GROUP BY runner_id, order_id, customer_id
            ORDER BY runner_id
    -- 7. What is the successful delivery percentage for each runner?
        -- Using Joins & Group By
            SELECT sq1.runner_id,
                   ((sq1.#Successful * 100)/(sq1.#Successful + ISNULL(sq2.#Cancelled,0))) AS[% Successful Delivery]
            FROM
                (SELECT o.runner_id, COUNT(DISTINCT o.order_id) AS [#Successful]
                FROM Orders o
                WHERE o.cancellation IS NULL
                GROUP BY o.runner_id) AS sq1
            LEFT JOIN
                (SELECT r.runner_id, COUNT(DISTINCT r.order_id) AS [#Cancelled]
                FROM Orders r
                WHERE r.cancellation IS NOT NULL
                GROUP BY r.runner_id) AS sq2
            ON sq1.runner_id = sq2.runner_id

        -- Using correlated sub queries
            SELECT sq.runner_id, ((#Success * 100)/(#Success + #Cancelled)) AS [% Successful Delivery]
            FROM
                (SELECT DISTINCT o.runner_id, 
                    (SELECT COUNT(DISTINCT s.order_id)
                        FROM Orders s
                        WHERE s.cancellation IS NULL
                        AND s.runner_id = o.runner_id) AS [#Success],
                    (SELECT COUNT(DISTINCT r.order_id)
                        FROM Orders r
                        WHERE r.cancellation IS NOT NULL
                        AND r.runner_id = o.runner_id) AS [#Cancelled]
                FROM Orders o) AS sq

/*
--          Q3.Ingredient Optimisation          */ --hard
    -- 1. What are the standard ingredients for each pizza?
    -- 2. What was the most commonly added extra?
        SELECT p.topping_name, COUNT(*)
        FROM customer_orders c
        LEFT JOIN pizza_toppings p
        ON c.exclusions = p.topping_id
        WHERE c.exclusions IS NOT NULL 
        GROUP BY p.topping_name
               
    -- 3. What was the most common exclusion? 
        --
        --
    -- 4. Generate an order item for each record in the customers_orders table in the format of one of the following:
        -- Meat Lovers
        -- Meat Lovers - Exclude Beef
        -- Meat Lovers - Extra Bacon
        -- Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
    -- 5. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
        -- For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
    -- 6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?