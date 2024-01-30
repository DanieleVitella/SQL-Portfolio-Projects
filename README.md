# Daniele Vitella: SQL Portfolio Projects

# [Project 1: Apple Store EDA+Data Analysis](https://github.com/DanieleVitella/SQL-Portfolio-Projects/blob/main/Apple%20Store%20EDA%2BData%20Analysis.sql)

## Project Context:
The client is a software engineer who would like to create an app for the Apple Store, he is looking for information on the best opportunities and target categories for his project. 
My job is to help him obtain useful insights for the creation of his app.

* The datasets used are Apple Store and Apple Store Description available on Kaggle.
* Performed exploratory data analysis using functions count(distinct), min(), max(), avg(), group by(), and order by ().
* Performed data analysis using case, joins, and rank() functions.
* Based on the insights I gathered, I wrote my final recommendations.

# [Project 2: Walmart Sales Data Analysis](https://github.com/DanieleVitella/SQL-Portfolio-Projects/blob/main/Project%202%3A%20Walmart%20Sales%20Data%20Analysis)
This project aims to explore Walmart's Sales data to understand top-performing branches and products, sales trends of different products, and customer behavior. The aim is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

Analysis List:
1. Product Analysis
  Conduct analysis of the data to understand the different product lines, the product lines performing best, and the product lines that need to be improved.
2. Sales Analysis
  This analysis aims to answer the question of the sales trends of products. The result of this can help us measure the effectiveness of each sales strategy the business applies and what modifications are needed to gain more sales.
3. Customer Analysis
  This analysis aims to uncover the different customer segments, purchase trends, and the profitability of each customer segment.

Approach Used
* Data Wrangling
  -Build a database
  - Create the table and insert the data.
  - Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.
* Feature Engineering
  - Add a new column named "time_of_da"y to give an insight of sales in the Morning, Afternoon, and Evening. This will help answer the question of which part of the day most sales are made.
  - Add a new column named "day_name" that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question of which week of the day each branch is busiest.
  - Add a new column named "month_name" that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
* Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the questions of this project.
