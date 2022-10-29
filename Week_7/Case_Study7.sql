/*          Database Creation           */
    -- CREATE DATABASE balanced_tree;


/*          Table Creation              */
    -- Product Hierarchy
        -- CREATE TABLE product_hierarchy (
        -- "id" INTEGER,
        -- "parent_id" INTEGER,
        -- "level_text" VARCHAR(19),
        -- "level_name" VARCHAR(8)
        -- );

        -- INSERT INTO product_hierarchy
        --   ("id", "parent_id", "level_text", "level_name")
        -- VALUES
        --   ('1', NULL, 'Womens', 'Category'),
        --   ('2', NULL, 'Mens', 'Category'),
        --   ('3', '1', 'Jeans', 'Segment'),
        --   ('4', '1', 'Jacket', 'Segment'),
        --   ('5', '2', 'Shirt', 'Segment'),
        --   ('6', '2', 'Socks', 'Segment'),
        --   ('7', '3', 'Navy Oversized', 'Style'),
        --   ('8', '3', 'Black Straight', 'Style'),
        --   ('9', '3', 'Cream Relaxed', 'Style'),
        --   ('10', '4', 'Khaki Suit', 'Style'),
        --   ('11', '4', 'Indigo Rain', 'Style'),
        --   ('12', '4', 'Grey Fashion', 'Style'),
        --   ('13', '5', 'White Tee', 'Style'),
        --   ('14', '5', 'Teal Button Up', 'Style'),
        --   ('15', '5', 'Blue Polo', 'Style'),
        --   ('16', '6', 'Navy Solid', 'Style'),
        --   ('17', '6', 'White Striped', 'Style'),
        --   ('18', '6', 'Pink Fluro Polkadot', 'Style');
    --
    -- Product Prices

        -- CREATE TABLE product_prices (
        --   "id" INTEGER,
        --   "product_id" VARCHAR(6),
        --   "price" INTEGER
        -- );

        -- INSERT INTO product_prices
        --   ("id", "product_id", "price")
        -- VALUES
        --   ('7', 'c4a632', '13'),
        --   ('8', 'e83aa3', '32'),
        --   ('9', 'e31d39', '10'),
        --   ('10', 'd5e9a6', '23'),
        --   ('11', '72f5d4', '19'),
        --   ('12', '9ec847', '54'),
        --   ('13', '5d267b', '40'),
        --   ('14', 'c8d436', '10'),
        --   ('15', '2a2353', '57'),
        --   ('16', 'f084eb', '36'),
        --   ('17', 'b9a74d', '17'),
        --   ('18', '2feb6b', '29');
    --
    -- Product Details
        -- CREATE TABLE product_details (
        --   "product_id" VARCHAR(6),
        --   "price" INTEGER,
        --   "product_name" VARCHAR(32),
        --   "category_id" INTEGER,
        --   "segment_id" INTEGER,
        --   "style_id" INTEGER,
        --   "category_name" VARCHAR(6),
        --   "segment_name" VARCHAR(6),
        --   "style_name" VARCHAR(19)
        -- );

        -- INSERT INTO product_details
        --   ("product_id", "price", "product_name", "category_id", "segment_id", "style_id", "category_name", "segment_name", "style_name")
        -- VALUES
        --   ('c4a632', '13', 'Navy Oversized Jeans - Womens', '1', '3', '7', 'Womens', 'Jeans', 'Navy Oversized'),
        --   ('e83aa3', '32', 'Black Straight Jeans - Womens', '1', '3', '8', 'Womens', 'Jeans', 'Black Straight'),
        --   ('e31d39', '10', 'Cream Relaxed Jeans - Womens', '1', '3', '9', 'Womens', 'Jeans', 'Cream Relaxed'),
        --   ('d5e9a6', '23', 'Khaki Suit Jacket - Womens', '1', '4', '10', 'Womens', 'Jacket', 'Khaki Suit'),
        --   ('72f5d4', '19', 'Indigo Rain Jacket - Womens', '1', '4', '11', 'Womens', 'Jacket', 'Indigo Rain'),
        --   ('9ec847', '54', 'Grey Fashion Jacket - Womens', '1', '4', '12', 'Womens', 'Jacket', 'Grey Fashion'),
        --   ('5d267b', '40', 'White Tee Shirt - Mens', '2', '5', '13', 'Mens', 'Shirt', 'White Tee'),
        --   ('c8d436', '10', 'Teal Button Up Shirt - Mens', '2', '5', '14', 'Mens', 'Shirt', 'Teal Button Up'),
        --   ('2a2353', '57', 'Blue Polo Shirt - Mens', '2', '5', '15', 'Mens', 'Shirt', 'Blue Polo'),
        --   ('f084eb', '36', 'Navy Solid Socks - Mens', '2', '6', '16', 'Mens', 'Socks', 'Navy Solid'),
        --   ('b9a74d', '17', 'White Striped Socks - Mens', '2', '6', '17', 'Mens', 'Socks', 'White Striped'),
        --   ('2feb6b', '29', 'Pink Fluro Polkadot Socks - Mens', '2', '6', '18', 'Mens', 'Socks', 'Pink Fluro Polkadot');
    --
    -- Sales
        -- CREATE TABLE balanced_tree.sales (
        --   "prod_id" VARCHAR(6),
        --   "qty" INTEGER,
        --   "price" INTEGER,
        --   "discount" INTEGER,
        --   "member" BOOLEAN,
        --   "txn_id" VARCHAR(6),
        --   "start_txn_time" TIMESTAMP
        -- );
--
/*          High Level Sales Analysis                   */
    -- What was the total quantity sold for all products?
        -- Window functions
            SELECT DISTINCT product_name, SUM(qty) OVER(PARTITION BY prod_id) AS quantity_sold
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            ORDER BY quantity_sold DESC
        -- Group by
            SELECT product_name, SUM(qty) AS quantity_sold
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            GROUP BY product_name
            ORDER BY quantity_sold DESC
        -- Correlated subqueries
            SELECT product_name,
                   (SELECT SUM(qty)
                    FROM sales s
                    WHERE p.product_id = s.prod_id) AS quantity_sold
            FROM product_details p
            ORDER BY quantity_sold DESC 

    -- What is the total generated revenue for all products before discounts?
        -- Group By
            SELECT product_name, SUM(s.qty * s.price) AS revenue
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            GROUP BY product_name
            ORDER BY revenue DESC
        
        -- Window functions
            SELECT DISTINCT product_name, SUM(s.qty * s.price) OVER(PARTITION BY prod_id) AS revenue
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            ORDER BY revenue DESC
        -- Correlated Subqueries
            SELECT product_name, (SELECT SUM(s.qty * s.price)
                                  FROM sales s
                                  WHERE p.product_id = s.prod_id) AS revenue
            FROM product_details p
            ORDER BY revenue DESC 
            -- OFFSET 0 ROW
            -- FETCH NEXT 3 ROWS ONLY
        --
    -- What was the total discount amount for all products?
        -- Group By
            SELECT product_name, CONVERT(DEC(10,2),SUM(s.qty * s.price * s.discount/100.0)) AS discount
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            GROUP BY product_name
            ORDER BY discount DESC
        
        -- Window functions
            SELECT DISTINCT product_name, CAST(SUM(s.qty * s.price * s.discount/100.0) OVER(PARTITION BY prod_id) AS DEC(10,2)) AS discount
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            ORDER BY discount DESC
        -- Correlated Subqueries
            SELECT product_name, (SELECT ROUND(SUM(s.qty * s.price * s.discount/100.0),2)
                                  FROM sales s
                                  WHERE p.product_id = s.prod_id) AS discount
            FROM product_details p
            ORDER BY discount DESC 
            -- OFFSET 0 ROW
            -- FETCH NEXT 3 ROWS ONLY
        --

/*          Transaction Analysis                        */
    -- How many unique transactions were there?
            SELECT COUNT(DISTINCT txn_id) AS [# Unique Transactions]
            FROM sales
    -- What is the average unique products purchased in each transaction? 
        -- I'm not sure of the question's requirements
        -- Group By
            SELECT AVG(qty) [Average # Unique Products Purchased]
            FROM
                (SELECT COALESCE(txn_id, 'total') AS txn_id , COUNT(qty) AS qty
                FROM sales s
                GROUP by ROLLUP(txn_id)) Q
            WHERE txn_id <> 'total'

        -- Window functions   
            SELECT DISTINCT txn_id, CONVERT(DEC(10,2), AVG(qty * 1.0) OVER(PARTITION BY txn_id)) AS [Avg Qty of Unique Products per Transaction]
            FROM sales s
            ORDER BY [Avg Qty of Unique Products per Transaction] DESC
        --
    -- What are the 25th, 50th and 75th percentile values for the revenue per transaction?
        --25th
            -- Percent_Rank()
                SELECT *
                FROM
                    (SELECT txn_id, revenue, PERCENT_RANK() OVER(ORDER BY revenue) percentile_rank
                    FROM
                        (SELECT DISTINCT txn_id, CONVERT(DEC(10,2),SUM(price * qty * (1-discount/100.0)) OVER(PARTITION BY txn_id)) AS revenue
                        FROM sales) Q) S
                WHERE percentile_rank > 0.25 AND percentile_rank < 0.26
                
        -- 50th Percentile_count() https://learn.microsoft.com/en-us/sql/t-sql/functions/percentile-cont-transact-sql?view=sql-server-ver16
                SELECT DISTINCT CONVERT(DEC(10,4),PERCENTILE_CONT(.25)
                       WITHIN GROUP (ORDER BY revenue)
                       OVER()) percentile_rank
                FROM
                    (SELECT DISTINCT txn_id, CONVERT(DEC(10,2),SUM(price * qty * (1-discount/100.0)) OVER(PARTITION BY txn_id)) AS revenue
                    FROM sales) Q
        --50th
                SELECT DISTINCT PERCENTILE_CONT(.50)
                       WITHIN GROUP (ORDER BY revenue)
                       OVER() percentile_rank
                FROM
                    (SELECT DISTINCT txn_id, CONVERT(DEC(10,2),SUM(price * qty * (1-discount/100.0)) OVER(PARTITION BY txn_id)) AS revenue
                    FROM sales) Q
        --75th
                SELECT DISTINCT PERCENTILE_CONT(.75)
                       WITHIN GROUP (ORDER BY revenue)
                       OVER() percentile_rank
                FROM
                    (SELECT DISTINCT txn_id, CONVERT(DEC(10,2),SUM(price * qty * (1-discount/100.0)) OVER(PARTITION BY txn_id)) AS revenue
                    FROM sales) Q
    -- What is the average discount value per transaction?
        -- 
            SELECT DISTINCT txn_id, CONVERT(DEC(10,4), AVG(discount) OVER(PARTITION BY txn_id)) AS [Avg Discount Value]
            FROM sales
            ORDER BY [Avg Discount Value] DESC
        
        -- 
            -- SELECT CONVERT(DEC(10,4), AVG([Discount Value])) AS [Avg Discount Value for all trasactions]
            -- FROM
            --     (SELECT DISTINCT txn_id, SUM(discount) OVER(PARTITION BY txn_id) AS [Discount Value]
            --     FROM sales) Q

    -- What is the percentage split of all transactions for members vs non-members?
        -- Pivoting
            WITH memCTE AS
                -- Derived table
                    (SELECT *
                    FROM        
                        (SELECT COALESCE(member, 'total') member, COUNT(DISTINCT txn_id) AS txn
                        FROM sales
                        GROUP BY member  WITH ROLLUP) Q
                -- Pivoting
                    PIVOT(
                        SUM(txn)
                        FOR member
                        IN(
                            [t],
                            [f],
                            [total]
                        ) 
                    ) AS Pivot_table)

            SELECT 
            CONCAT(CONVERT(DEC(10,2), t * 100.0/total),'%') AS members,
            CONCAT(CONVERT(DEC(10,2), f * 100.0/total),'%') AS non_members
            FROM memCTE
        
        -- Group By
            SELECT member, CONCAT(CONVERT(DEC(10,2),#txns*100.0/total),'%') AS percentage
            FROM    
                (SELECT DISTINCT member, COUNT(DISTINCT txn_id) AS #txns, total
                FROM sales, (SELECT COUNT(DISTINCT txn_id) AS total FROM sales) s
                GROUP BY member, total) Q
       
        -- Window functions   
            SELECT member, CONCAT(CONVERT(DEC(10,2),#txns*100.0/total),'%') AS percentage
            FROM    
                (SELECT DISTINCT member, total, LAST_VALUE(Rank) 
                        OVER(PARTITION BY member ORDER BY Rank ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS #txns
                FROM
                    (SELECT DISTINCT member, txn_id, DENSE_RANK() OVER(PARTITION BY member ORDER BY txn_id) AS Rank
                     FROM sales)r,
                    (SELECT COUNT(DISTINCT txn_id) AS total 
                     FROM sales) s
            ) Q

    -- What is the average revenue for member transactions and non-member transactions?
            SELECT member, revenue/#txns AS Avg_revenue
            FROM    
                (SELECT DISTINCT s.member, SUM(price * qty * (1 - discount/100.0)) OVER(PARTITION BY s.member) AS revenue, #txns
                 FROM sales s
                 LEFT JOIN (SELECT member, COUNT(DISTINCT txn_id) as #txns
                         FROM sales
                         GROUP BY member) r
                 ON s.member = r.member) Q
            
            --
            SELECT member, SUM(qty * price * (1 - discount/100.0))/COUNT(DISTINCT txn_id) Avg_revenue
            FROM sales
            GROUP BY member
            ORDER BY member
            
/*          Product Analysis                            */
    -- What are the top 3 products by total revenue before discount?
        -- Group By
            SELECT TOP 3 product_name, SUM(qty * s.price) revenue
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            GROUP BY product_name
            ORDER BY revenue DESC

        -- Alternatively    
            SELECT product_name, SUM(qty * s.price) revenue
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            GROUP BY product_name
            ORDER BY revenue DESC
            OFFSET 0 ROWS
            FETCH NEXT 3 ROWS ONLY
        
        -- Correlated subqueries    
            SELECT TOP 3 product_name, 
            (SELECT SUM(qty * s.price) 
             FROM sales s
             WHERE s.prod_id = p.product_id) revenue
            FROM product_details p
            ORDER BY revenue DESC
        
        -- Window functions    
            SELECT DISTINCT TOP 3 product_name, 
            SUM(qty * s.price) OVER(PARTITION BY product_name) revenue
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            ORDER BY revenue DESC

    -- What is the total quantity, revenue and discount for each segment?
            SELECT segment_name, SUM(qty) AS quantity, 
                   SUM(qty * s.price) AS revenue,
                   CONVERT(DEC(10,2), SUM(qty * s.price * DISCOUNT/100.0)) AS discount
            FROM sales s
            LEFT JOIN product_details p
            ON p.product_id = s.prod_id
            GROUP BY segment_name
    -- What is the top selling product for each segment?
        -- Group By
            SELECT segment_name, product_name, SUM(qty) as Quantity
            FROM sales s
            LEFT JOIN product_details p 
            ON p.product_id = s.prod_id
            GROUP BY segment_name, product_name, prod_id
            HAVING SUM(qty) =   (SELECT MAX(quantity) 
                                 FROM
                                     (SELECT segment_name, SUM(qty) quantity
                                      FROM sales s1
                                      LEFT JOIN product_details p1
                                      ON p1.product_id = s1.prod_id
                                      GROUP BY segment_name, product_name) Q
                                 WHERE Q.segment_name = p.segment_name)
            ORDER BY segment_name, Quantity DESC
            
        -- Window functions
            SELECT DISTINCT segment_name, 
                   FIRST_VALUE(product_name) OVER(PARTITION BY segment_name ORDER BY Quantity DESC) AS  product_name,
                   FIRST_VALUE(Quantity) OVER(PARTITION BY segment_name ORDER BY Quantity DESC) AS  Quantity
            FROM
                (SELECT DISTINCT segment_name, product_name, prod_id, SUM(qty) OVER(PARTITION BY segment_name, product_name)as Quantity
                FROM sales s
                LEFT JOIN product_details p 
                ON p.product_id = s.prod_id) Q
            ORDER BY segment_name, Quantity DESC

    -- What is the total quantity, revenue and discount for each category?
        -- Group By
            SELECT category_name, SUM(qty) Quantity,
                   convert(DEC(10,2),SUM(qty * s.price * (1 - discount/100.0))) AS Revenue,
                   convert(DEC(10,2),SUM(qty * s.price * discount/100.0)) AS Discount
            FROM sales s
            LEFT JOIN product_details p
            ON s.prod_id = p.product_id
            GROUP BY category_name
        
        -- Correlated Subqueries
            SELECT DISTINCT category_name,
                   (SELECT SUM(qty) FROM sales s1
                    LEFT JOIN product_details p1
                    ON s1.prod_id = p1.product_id
                    WHERE p.category_id = p1.category_id) Quantity,
                   (SELECT convert(DEC(10,2),SUM(qty * s2.price * (1 - discount/100.0))) FROM sales s2
                    LEFT JOIN product_details p2
                    ON s2.prod_id = p2.product_id
                    WHERE p.category_id = p2.category_id) Revenue,
                   (SELECT convert(DEC(10,2),SUM(qty * s3.price * discount/100.0)) FROM sales s3
                    LEFT JOIN product_details p3
                    ON s3.prod_id = p3.product_id
                    WHERE p.category_id = p3.category_id) Discount
            FROM product_details p
            
    -- What is the top selling product for each category?
    -- What is the percentage split of revenue by product for each segment?
    -- What is the percentage split of revenue by segment for each category?
    -- What is the percentage split of total revenue by category?
    -- What is the total transaction “penetration” for each product? (hint: penetration = number of transactions where at least 1 quantity of a product was purchased divided by total number of transactions)
    -- What is the most common combination of at least 1 quantity of any 3 products in a 1 single transaction?

            SELECT *
            FROM sales s
            LEFT JOIN product_details p 
            ON p.product_id = s.prod_id