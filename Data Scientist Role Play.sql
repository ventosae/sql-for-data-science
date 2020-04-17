Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000 
ii. Business table = 10000 
iii. Category table = 10000 
iv. Checkin table = 10000 
v. elite_years table = 10000 
vi. friend table = 10000 
vii. hours table = 10000 
viii. photo table = 10000 
ix. review table = 10000 
x. tip table = 10000
xi. user table = 10000 
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562 
iii. Category = 2643 
iv. Attribute = 1115 
v. Review = 10000 
vi. Checkin = 493 
vii. Photo = 10000  
viii. Tip = 10000 (user_id)
ix. User = 10000 
x. Friend = 11 (user_id)
xi. Elite_years = 2780 

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer:
	"no."
	
	SQL code used to arrive at answer:

    SELECT * 
    FROM user 
    WHERE compliment_profile IS NULL 
    OR name IS NULL
    OR review_count IS NULL
    OR yelping_since IS NULL
    OR useful IS NULL
    OR funny IS NULL
    OR cool IS NULL
    OR fans IS NULL
    OR average_stars IS NULL
    OR compliment_hot IS NULL
    OR compliment_more IS NULL
    OR compliment_profile IS NULL
    OR compliment_cute IS NULL
    OR compliment_list IS NULL
    OR compliment_note IS NULL
    OR compliment_plain IS NULL
    OR compliment_cool IS NULL
    OR compliment_funny IS NULL
    OR compliment_writer IS NULL
    OR compliment_photos IS NULL
	

4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1.0	max: 5.0	avg: 3.7082 
		
	
	ii. Table: Business, Column: Stars
	
		min: 1.0	max: 5.0	avg: 3.6549 
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2 		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1 	max: 53		avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0 		max: 2000 	avg: 24.2995 
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:

    SELECT bus.id
    ,bus.city
    ,count(rev.id) as reviews
    FROM business bus 
    INNER JOIN review rev ON rev.business_id = bus.id
    GROUP BY bus.city 
    ORDER BY reviews DESC
	
	Copy and Paste the Result Below:

+-----------------+---------+
| city            | reviews |
+-----------------+---------+
| Las Vegas       |     193 |
| Phoenix         |      65 |
| Toronto         |      51 |
| Scottsdale      |      37 |
| Henderson       |      30 |
| Tempe           |      28 |
| Pittsburgh      |      23 |
| Chandler        |      22 |
| Charlotte       |      21 |
| Montréal        |      18 |
| Madison         |      16 |
| Gilbert         |      13 |
| Mesa            |      13 |
| Cleveland       |      12 |
| North Las Vegas |       6 |
| Edinburgh       |       5 |
| Glendale        |       5 |
| Lakewood        |       5 |
| Cave Creek      |       4 |
| Champaign       |       4 |
| Markham         |       4 |
| North York      |       4 |
| Mississauga     |       3 |
| Surprise        |       3 |
| Avondale        |       2 |
+-----------------+---------+

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

    SELECT stars
    ,review_count
    FROM business
    WHERE city = 'Avon'
    GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+--------------+
| stars | review_count |
+-------+--------------+
|   1.5 |           10 |
|   2.5 |            3 |
|   3.5 |           50 |
|   4.0 |           17 |
|   4.5 |           31 |
|   5.0 |            3 |
+-------+--------------+

ii. Beachwood

SQL code used to arrive at answer:

SELECT stars
,review_count
FROM business
WHERE city = 'Beachwood'
GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+--------------+
| stars | review_count |
+-------+--------------+
|   2.0 |            8 |
|   2.5 |            3 |
|   3.0 |            3 |
|   3.5 |            3 |
|   4.0 |           69 |
|   4.5 |            3 |
|   5.0 |            4 |
+-------+--------------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

	SELECT id AS 'User Id'
    , name AS 'User Name'
    , review_count
    FROM user
    ORDER BY review_count DESC
    LIMIT 3
		
	Copy and Paste the Result Below:

    +------------------------+-----------+--------------+
    | User Id                | User Name | review_count |
    +------------------------+-----------+--------------+
    | -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |
    | -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |
    | -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |
    +------------------------+-----------+--------------+	


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	
    From simply pulling both fans and the number of reviews it's not clear if there is a correlation. 
    
    -- code I used

    SELECT id AS 'User Id'
    , name AS 'User Name'
    , review_count
    , fans
    FROM user
    ORDER BY review_count DESC
    LIMIT 10

    -- results 
    +------------------------+-----------+--------------+------+
    | User Id                | User Name | review_count | fans |
    +------------------------+-----------+--------------+------+
    | -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
    | -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |   50 |
    | -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 |
    | -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 |
    | -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
    | --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
    | -gokwePdbXjfS0iF7NsUGA | eric      |         1116 |   16 |
    | -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 |
    | -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
    | -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |
    +------------------------+-----------+--------------+------+

    In order to determine the correlation between these two data sets, we can use the Pearson Correlation formula. Unfortunately due to limitations of SQLlit (no pow, or sqroot)
    I've managed to get the only coefficient of determination (R2) which is 0.43; however, if we extract a square root and get Coefficient of Correlation the result is 0.66 which indicates a strong uphill (positive) linear relationship.
    In summary, there is a strong correlation between a number of reviews per user and a number of fans. 

    -- sql I used 

    select avg( (review_count - avg_x) * (fans - avg_y) )*avg( (review_count - avg_x) * (fans - avg_y) )/(var_x*var_y) as "Coeficent of Determination - R2" 
    from user, (select 
      avg_x,
      avg_y,
      avg((review_count - avg_x)*(review_count - avg_x)) as var_x, 
      avg((fans - avg_y)*(fans - avg_y)) as var_y 
      from user, (select 
          avg(review_count) as avg_x, 
          avg(fans) as avg_y 
          from user)
    );
  
    -- results
    +---------------------------------+
    | Coeficent of Determination - R2 |
    +---------------------------------+
    |                  0.437136492915 |
    +---------------------------------+


9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:
    There are 1780 reviews with a word 'love' in it and 232 with a word 'hate'. Clearely there are more reviews with 'love' rather than 'hate'.
	
	SQL code used to arrive at answer:

    SELECT count(rev.text) as 'Total Reviews'
    ,SUM(CASE WHEN rev.text like '%hate%' then 1 ELSE 0 END) as 'Reviews with hate'
    ,SUM(CASE WHEN rev.text like '%love%' then 1 ELSE 0 END) as 'Reviews with love'
    FROM review rev 
	
    -- resulth
    +---------------+-------------------+-------------------+
    | Total Reviews | Reviews with hate | Reviews with love |
    +---------------+-------------------+-------------------+
    |         10000 |               232 |              1780 |
    +---------------+-------------------+-------------------+
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:

	    SELECT id AS 'User Id'
        , name AS 'User Name'
        , review_count
        , fans
        FROM user
        ORDER BY fans DESC
        LIMIT 10
	
	Copy and Paste the Result Below:
    +------------------------+-----------+--------------+------+
    | User Id                | User Name | review_count | fans |
    +------------------------+-----------+--------------+------+
    | -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 |
    | -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
    | --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
    | -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
    | -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |
    | -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 |
    | -9bbDysuiWeo2VShFJJtcw | Cat       |          377 |  133 |
    | -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
    | -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 |
    | -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 |
    +------------------------+-----------+--------------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

-- SUMMARY 
From the data we can make a conclusion that restournats with 4-5 start tend to work longer hours. 

-- CODE
SELECT hou.hours
,CASE WHEN bus.stars < 2 THEN '1+ Stars'
WHEN bus.stars >= 2 AND bus.stars < 4 THEN '2-3 Stars'
ELSE '4-5 Stars' END Rating
FROM business bus
INNER JOIN category cat ON cat.business_id = bus.id
INNER JOIN hours hou ON hou.business_id = bus.id
WHERE bus.city = 'Toronto' AND cat.category = 'Restaurants' 
GROUP BY hou.hours
ORDER BY Rating desc

ii. Do the two groups you chose to analyze have a different number of reviews?
         
-- RESULT

+---------------+-----------+
| reviews_count | Rating    |
+---------------+-----------+
|           123 | 4-5 Stars |
|            86 | 2-3 Stars |
+---------------+-----------+

-- CODE 
SELECT sum(DISTINCT bus.review_count) as reviews_count
,CASE WHEN bus.stars < 2 THEN '1+ Stars'
WHEN bus.stars >= 2 AND bus.stars < 4 THEN '2-3 Stars'
ELSE '4-5 Stars' END Rating
FROM business bus
INNER JOIN category cat ON cat.business_id = bus.id
INNER JOIN hours hou ON hou.business_id = bus.id
WHERE bus.city = 'Toronto' AND cat.category = 'Restaurants' 
GROUP BY Rating
ORDER BY Rating desc
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

+--------------------+---------------+----------+-----------+-----------+
| Downtown or Suburb | Total Reviews | 1+ Stars | 2-3 Stars | 4-5 Stars |
+--------------------+---------------+----------+-----------+-----------+
| Downtown           |           112 |        0 |         3 |         1 |
| Suburb             |           179 |        1 |         1 |         4 |
+--------------------+---------------+----------+-----------+-----------+

I've decided to slice data by neighborhood and split it into two groups Downtown and Suburbs to understand where restaurants in Toronto have better reviews.
Turns out suburbs not only have more reviews but also have more places with a '4-5 Stars' rating. '


SQL code used for analysis:

SELECT (CASE WHEN bus.neighborhood IN ('Downtown Core', 'Entertainment District', 'High Park') then 'Downtown' ELSE 'Suburb' END) as 'Downtown or Suburb'
,sum(DISTINCT bus.review_count) as 'Total Reviews'
,SUM(CASE WHEN bus.stars < 2 then 1 ELSE 0 END) as '1+ Stars'
,SUM(CASE WHEN bus.stars >= 2 AND bus.stars < 4  then 1 ELSE 0 END) as '2-3 Stars'
,SUM(CASE WHEN bus.stars >= 4 then 1 ELSE 0 END) as '4-5 Stars'
FROM business bus
INNER JOIN category cat ON cat.business_id = bus.id
WHERE bus.city = 'Toronto' AND cat.category = 'Restaurants' 
GROUP BY 1
		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:

--ANALYSIS
From the data we can draw a conclusion that open busineses have more reviews on average (31) than closed ones (23). 

--CODE
SELECT bus.is_open
,count(bus.name) as Businesses
,sum(bus.review_count) as Reviews
FROM business bus
GROUP BY 1
--RESULT
+---------+------------+---------+
| is_open | Businesses | Reviews |
+---------+------------+---------+
|       0 |       1520 |   35261 |
|       1 |       8480 |  269300 |
+---------+------------+---------+
         
ii. Difference 2:

--ANALYSIS
From the data we can see that open restourants have better reviews on average (3.68) than closed ones (3.52). 
--CODE 
SELECT bus.is_open
,ROUND(avg(stars),2) as average_rating
FROM business bus
GROUP BY 1
--RESULT
+---------+----------------+
| is_open | average_rating |
+---------+----------------+
|       0 |           3.52 |
|       1 |           3.68 |
+---------+----------------+
         
         
SQL code used for analysis:

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
                           
                  
iii. Output of your finished dataset:
         
         
iv. Provide the SQL code you used to create your final dataset:
