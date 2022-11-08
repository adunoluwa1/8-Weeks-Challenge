# 8-Week SQL Challenge 
# Cast Study #8 - Fresh Segments

[```Home```](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge) [```🌐 Case Study #8 - Fresh Segments```](https://8weeksqlchallenge.com/case-study-8/)

![image](https://user-images.githubusercontent.com/99233674/200472997-a638419c-c5ac-40a4-b1d3-31fed5d1f702.png)

# 📕 Table of Contents
- [🛠️ Background Statement](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/blob/main/Week_8/Readme.md#%EF%B8%8F-background-statement)
- [📂 Dataset](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/blob/main/Week_8/Readme.md#-dataset)
- [✒️ Case Study Questions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/blob/main/Week_8/Readme.md#%EF%B8%8F-case-study-questions)
- [🏆 Solutions](https://github.com/adunoluwa1/SQL-8-Weeks-Challenge/blob/main/Week_8/Readme.md#-solutions)

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
The following questions can be considered key business questions that are required to be answered for the Fresh Segments team.

Most questions can be answered using a single query however some questions are more open ended and require additional thought and not just a coded solution!

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
 
   |month_year |       interest_name                | max_index_composition |3_month_moving_avg |1_month_ago                          |   	2_months_ago                      |
   |-----------|------------------------------------|-----------------------|-------------------|-------------------------------------|--------------------------------------|
   |2018-09-01 |   Work Comes First Travelers       |   8.26                |  7.61             |   Las Vegas Trip Planners: 7.21	   |   Las Vegas Trip Planners: 7.36      |    
   |2018-10-01 |   Work Comes First Travelers       |   9.14                |  8.20             |   Work Comes First Travelers: 8.26  |   Las Vegas Trip Planners: 7.21      |    
   |2018-11-01 |   Work Comes First Travelers       |   8.28                |  8.56             |   Work Comes First Travelers: 9.14  |   Work Comes First Travelers: 8.26   |
   |2018-12-01 |   Work Comes First Travelers       |   8.31                |  8.58             |   Work Comes First Travelers: 8.28  |   Work Comes First Travelers: 9.14   |
   |2019-01-01 |   Work Comes First Travelers       |   7.66                |  8.08             |   Work Comes First Travelers: 8.31  |   Work Comes First Travelers: 8.28   |
   |2019-02-01 |   Work Comes First Travelers       |   7.66                |  7.88             |   Work Comes First Travelers: 7.66  |   Work Comes First Travelers: 8.31   |
   |2019-03-01 |   Alabama Trip Planners            |   6.54                |  7.29             |   Work Comes First Travelers: 7.66  |   Work Comes First Travelers: 7.66   |
   |2019-04-01 |   Solar Energy Researchers         |   6.28                |  6.83             |   Alabama Trip Planners: 6.54       |   Work Comes First Travelers: 7.66   |
   |2019-05-01 |   Readers of Honduran Content      |   4.41                |  5.74             |   Solar Energy Researchers: 6.28    |   Alabama Trip Planners: 6.54        |
   |2019-06-01 |   Las Vegas Trip Planners          |   2.77                |  4.49             |   Readers of Honduran Content: 4.41 |   Solar Energy Researchers: 6.28     |
   |2019-07-01 |   Las Vegas Trip Planners          |   2.82                |  3.33             |   Las Vegas Trip Planners: 2.77     |   Readers of Honduran Content: 4.41  |
   |2019-08-01 |   Cosmetics and Beauty Shoppers    |   2.73                |  2.77             |   Las Vegas Trip Planners: 2.82     |   Las Vegas Trip Planners: 2.77      |


# 🏆 Solutions
  <details><summary>View solution</summary>
  <p>
  
## A. Data Exploration and Cleansing
   
   1. Update the fresh_segments.interest_metrics table by modifying the month_year column to be a date data type with the start of the month
  
  ```SQL
          ALTER TABLE interest_metrics
          ALTER COLUMN month_year VARCHAR(10);
      
          UPDATE interest_metrics
          SET [month_year] = PARSE([month_year] AS DATE using 'AR-LB') 
          
          ALTER TABLE interest_metrics
          ALTER COLUMN month_year DATE;  
  ```
   2. What is count of records in the fresh_segments.interest_metrics for each month_year value sorted in chronological order (earliest to latest) with the null values appearing first?
  
  ```SQL
      -- Group By
        SELECT month_year, COUNT(*) #records
        FROM interest_metrics
        GROUP BY month_year
        ORDER BY month_year  

      -- Window functions
        SELECT DISTINCT month_year, COUNT(*) OVER(PARTITION BY month_year) #records
        FROM interest_metrics
        ORDER BY month_year     
  ```
   3. What do you think we should do with these null values in the fresh_segments.interest_metrics
  
  ```SQL
      --
        SELECT *
        FROM interest_metrics
        WHERE interest_id IS NOT NULL    
  ```
   4. How many interest_id values exist in the fresh_segments.interest_metrics table but not in the fresh_segments.interest_map table? What about the other way around
  
  ```SQL
      -- One
        SELECT interest_id
        FROM interest_metrics
        EXCEPT
        SELECT ID
        FROM interest_map


        SELECT  interest_id 
        FROM interest_metrics 
        WHERE interest_id NOT IN (SELECT id
                                  FROM interest_map)
      -- Two
        SELECT ID
        FROM interest_map
        EXCEPT
        SELECT interest_id
        FROM interest_metrics

        SELECT id
        FROM interest_map
        WHERE id NOT IN (SELECT interest_id
                         FROM interest_metrics
                         WHERE interest_id IS NOT NULL)    
  ```
   5. Summarise the id values in the fresh_segments.interest_map by its total record count in this table
  
  ```SQL
      -- Correlated subqueries
        SELECT ID, (SELECT COUNT(*) FROM interest_metrics i WHERE i.interest_id = m.id) #Records
        FROM interest_map m

      -- Group By
        SELECT ID, COUNT(*) #Records
        FROM interest_map m
        LEFT JOIN interest_metrics i
        ON m.id = i.interest_id
        GROUP BY ID

      -- Window functions
        SELECT DISTINCT ID, COUNT(*) OVER(PARTITION BY ID) #Records
        FROM interest_map m
        LEFT JOIN interest_metrics i
        ON m.id = i.interest_id
    
  ```
   6. What sort of table join should we perform for our analysis and why? Check your logic by checking the rows where interest_id = 21246 in your joined output and include all columns from fresh_segments.interest_metrics and all columns from fresh_segments.interest_map except from the id column.
  
  ```SQL
      --
        SELECT *
        FROM interest_map m
        LEFT JOIN interest_metrics i
        ON m.id = i.interest_id
        WHERE interest_id = 21246    
  ```
   7. Are there any records in your joined table where the month_year value is before the created_at value from the fresh_segments.interest_map table? Do you think these values are valid and why?
  
  ```SQL
      -- 
        SELECT *
        FROM interest_map m
        LEFT JOIN interest_metrics i
        ON m.id = i.interest_id
        WHERE month_year < created_at
        AND month_year IS NOT NULL    
  ```
    
## B. Interest Analysis

   1. Which interests have been present in all month_year dates in our dataset?
  
  ```SQL
         SELECT i.interest_name,interest_id, COUNT(_month) #months, 
               STRING_AGG(_month, ',') WITHIN GROUP(ORDER BY month_year) visual
        FROM interest_metrics m
        LEFT JOIN interest_map i
        ON i.id = m.interest_id
        GROUP BY interest_name, interest_id
        HAVING COUNT(_month) = (SELECT DATEDIFF(MM,MIN(month_year), MAX(month_year)) + 1
                                FROM interest_metrics)
        ORDER BY CAST(interest_id AS INT)   
  ```
   2. Using this same total_months measure - calculate the cumulative percentage of all records starting at 14 months - which total_months value passes the 90% cumulative percentage value?
  
  ```SQL
          
        WITH Q AS
            (SELECT interest_id, COUNT(_month) #months
             FROM interest_metrics
             WHERE interest_id IS NOT NULL
             GROUP BY interest_id)
        
        SELECT DISTINCT #months, 
               COUNT(interest_id) OVER(PARTITION BY #months) #ids,
               CONVERT(DEC(10,2), COUNT(interest_id) OVER(ORDER BY #months) * 100.0 / (SELECT COUNT(interest_id) FROM Q)) [%GT]
        FROM Q
            
  ```
   3. If we were to remove all interest_id values which are lower than the total_months value we found in the previous question - how many total data points would we be removing?
  
  ```SQL
        SELECT COUNT(*)
        FROM
            (SELECT interest_id, COUNT(_month) #months
             FROM interest_metrics
             GROUP BY interest_id
             HAVING COUNT(_month) < 14) Q    
  ```
   4. Does this decision make sense to remove these data points from a business perspective? Use an example where there are all 14 months present to a removed interest example for your arguments - think about what it means to have less months present from a segment perspective.

   5. After removing these interests - how many unique interests are there for each month?
  
  ```SQL
        SELECT _month, COUNT(DISTINCT interest_id) #ids
        FROM interest_metrics
        WHERE interest_id NOT IN  (SELECT interest_id
                                   FROM interest_metrics
                                   WHERE interest_id IS NOT NULL
                                   GROUP BY interest_id
                                   HAVING COUNT(_month) < 14)
        GROUP BY _month;    
  ```
    
## C. Segment Analysis
   
   1. Using our filtered dataset by removing the interests with less than 6 months worth of data, which are the top 10 and bottom 10 interests which have the largest composition values in any month_year? Only use the maximum composition value for each interest but you must keep the corresponding month_year
  
  ```SQL
        CREATE OR ALTER VIEW filtered_set AS
        SELECT *
        FROM interest_metrics m 
        LEFT JOIN interest_map i
        ON M.interest_id = I.id
        WHERE interest_id NOT IN  (SELECT interest_id
                                   FROM interest_metrics
                                   WHERE interest_id IS NOT NULL
                                   GROUP BY interest_id
                                   HAVING COUNT(_month) < 14)

        WITH Q AS
          (SELECT month_year, interest_id, composition, ROW_NUMBER() 
                  OVER(PARTITION BY month_year ORDER BY composition DESC) #rank
           FROM filtered_set)
        
        SELECT *
        FROM Q q1          
        WHERE #rank <=10 OR #rank >= (SELECT MAX(#Rank) - 10
                                      FROM Q q2
                                      WHERE q1.month_year = q2.month_year)
       
    
  ```
   
   2. Which 5 interests had the lowest average ranking value?
  
  ```SQL
        SELECT DISTINCT interest_name, AVG(RANKING) OVER(PARTITION BY interest_id) avg_rank
        FROM filtered_set
        ORDER BY avg_rank ASC
        OFFSET 0 ROWS
        FETCH NEXT 5 ROWS ONLY    
  ```
    
   3. Which 5 interests had the largest standard deviation in their percentile_ranking value?
  
  ```SQL
        SELECT DISTINCT interest_name, CONVERT(DEC(10,2), STDEV(percentile_ranking) OVER(PARTITION BY interest_id)) std
        FROM filtered_set
        ORDER BY std DESC
        OFFSET 0 ROWS
        FETCH NEXT 5 ROWS ONLY    
  ```
   
   4. For the 5 interests found in the previous question - what was minimum and maximum percentile_ranking values for each interest and its corresponding year_month value? Can you describe what is happening for these 5 interests?
  
  ```SQL
         WITH Q AS
            (SELECT DISTINCT TOP 5 interest_id, 
             CONVERT(DEC(10,2), STDEV(percentile_ranking) OVER(PARTITION BY interest_id)) std
             FROM filtered_set
             ORDER BY std DESC)
        
        SELECT interest_name, percentile_ranking, month_year
        FROM  filtered_set f1   
        WHERE interest_id IN (SELECT interest_id FROM Q)
        AND (percentile_ranking = (SELECT MAX(percentile_ranking)
                                  FROM filtered_set f2
                                  WHERE f1.interest_id = f2.interest_id)
        OR  percentile_ranking =  (SELECT MIN(percentile_ranking)
                                  FROM filtered_set f2
                                  WHERE f1.interest_id = f2.interest_id))
           
  ```
    
   5. How would you describe our customers in this segment based off their composition and ranking values? What sort of products or services should we show to these customers and what should we avoid?

## D. Index Analysis
  The index_value is a measure which can be used to reverse calculate the average composition for Fresh Segments’ clients.
  
  1. Average composition can be calculated by dividing the composition column by the index_value column rounded to 2 decimal places.
  
  ```SQL
        CREATE OR ALTER VIEW comp AS
        SELECT *, CONVERT(DEC(10,2), composition/index_value) avg_composition
        FROM interest_metrics m
        LEFT JOIN interest_map i 
        ON i.id = m.interest_id
        WHERE interest_id IS NOT NULL

        SELECT *
        FROM comp
    
  ```
  2. What is the top 10 interests by the average composition for each month?
  
  ```SQL
        SELECT * 
        FROM
          (SELECT interest_name, DATENAME(MM,month_year) [month], month_year, avg_composition,
                ROW_NUMBER() OVER(PARTITION BY month_year ORDER BY avg_composition DESC) #Rank
           FROM comp
           WHERE _month IS NOT NULL) Q
        WHERE #Rank <= 10
        ORDER BY month_year    
  ```
  3. For all of these top 10 interests - which interest appears the most often?
  
  ```SQL
        SELECT DISTINCT interest_name, COUNT(interest_name) OVER(PARTITION BY interest_name) #frequency 
        FROM
          (SELECT interest_name, DATENAME(MM,month_year) [month], month_year, avg_composition,
                ROW_NUMBER() OVER(PARTITION BY month_year ORDER BY avg_composition DESC) #Rank
           FROM comp
           WHERE _month IS NOT NULL) Q
        WHERE #Rank <= 10
        ORDER BY #frequency DESC
            
  ```
  4. What is the average of the average composition for the top 10 interests for each month?
  
  ```SQL
      WITH Q AS
        (SELECT DISTINCT interest_id
        FROM
          (SELECT interest_id, DATENAME(MM,month_year) [month], month_year, avg_composition,
                ROW_NUMBER() OVER(PARTITION BY month_year ORDER BY avg_composition DESC) #Rank
           FROM comp
           WHERE _month IS NOT NULL) Q
        WHERE #Rank <= 10)

      SELECT DISTINCT month_year, DATENAME(MM,month_year) [month], AVG(avg_composition) OVER(PARTITION BY month_year) avg_avg_comp
      FROM comp 
      WHERE interest_id IN (SELECT * FROM Q)
      ORDER BY month_year
  ```
  5. What is the 3 month rolling average of the max average composition value from September 2018 to August 2019 and include the previous top ranking interests in the same output shown below.
  
  ```SQL
      --
      WITH Q AS
        (SELECT DISTINCT interest_id
         FROM
           (SELECT interest_id, month_year, avg_composition,
                 ROW_NUMBER() OVER(PARTITION BY month_year ORDER BY avg_composition DESC) #Rank
            FROM comp
            WHERE _month IS NOT NULL) Q
         WHERE #Rank <= 10)
      --
      SELECT month_year, [month], interest_name, max_avg_comp, 
             CONVERT(DEC(10,2), AVG(max_avg_comp) OVER(ORDER BY month_year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)) [3_month_rolling_avg],
             CONCAT_WS(' ',LAG(interest_name,1) OVER(ORDER BY month_year),LAG(max_avg_comp,1) OVER(ORDER BY month_year)) [1_month_ago],
             CONCAT_WS(' ',LAG(interest_name,2) OVER(ORDER BY month_year),LAG(max_avg_comp,2) OVER(ORDER BY month_year)) [2_months_ago]
      FROM
        (SELECT DISTINCT month_year, DATENAME(MM,month_year) [month], interest_name, avg_composition max_avg_comp
        FROM comp c1
        WHERE interest_id IN (SELECT * FROM Q)
        AND avg_composition = (SELECT MAX(avg_composition) 
                               FROM comp c2
                               WHERE c1.month_year = c2.month_year)) subq
      ORDER BY month_year
      OFFSET 2 ROWS
   
  ```
  6. Provide a possible reason why the max average composition might change from month to month? Could it signal something is not quite right with the overall business model for Fresh Segments?
  
  </p>
  </details>

