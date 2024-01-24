CREATE TABLE applestore_description_combined AS

SELECT * FROM appleStore_description1

UNION ALL

SELECT * FROM appleStore_description2

UNION ALL

SELECT * FROM appleStore_description3

UNION ALL

SELECT * FROM appleStore_description4

**EXPLORATORY DATA ANALYSIS**

-- check the number of unique apps in both tables 
SELECT COUNT(distinct id) as UniqueAppId
from AppleStore
--7197

SELECT COUNT(distinct id) as UniqueAppId
from applestore_description_combined
--7197
-- no missing data between the two tables

-- Check for any missing values in key fields

select count(*) as MissingValues
from AppleStore
where track_name is null or user_rating is null or prime_genre is null
-- 0 missing values

select count(*) as MissingValues
from applestore_description_combined
where app_desc is null 
-- 0 missing values

-- Find out the number of Apps per genre
select prime_genre, count(*) as NumApps
from AppleStore
group by prime_genre
order by NumApps DESC
-- Games and Entertainment are leaders in app categoryAppleStore

--Get an overview of app's rating
select min(user_rating) as MinRating,
	max(user_rating) as MaxRating,
    avg(user_rating) as AVGRating 
from AppleStore
-- min = 0; max = 5; AVG = 3.52


**DATA ANALYSIS**

--Determine wheter paid apps have higher ratings than free apps

select CASE
			when price > 0 then 'Paid'
            else 'Free'
       end as App_Type,
       avg(user_rating) as Avg_Rating
from AppleStore
group by App_Type
-- Free Apps = 3.37; Paid Apps = 3.72;

--Check if apps with more supported languages have higher ratings 

select case
			when lang_num < 10 then '<10 languages'
            when lang_num between 10 and 30 then '10-30 languages'
            else '>30 languages'
       end as language_bucket,
       avg(user_rating) as Avg_Rating
from AppleStore
group by language_bucket
order by Avg_Rating DESC
-- 10-30 languages = 4.13; > 30 languages = 3.7; <10 languages = 3.36;
-- We don't need to work on so many languagesAppleStore

--Check genres with low ratings

SELECT  prime_genre,
		avg(user_rating) as Avg_Rating
from AppleStore
group by prime_genre
order by Avg_Rating ASC
limit 10
-- in Finance, and Books there are low ratings apps, meaning there might be a good opportunity   


--Check if there is correlation between the lenght of the app description and the user ratings 
SELECT CASE
			when length(b.app_desc) <500 then 'Short'
            when length(b.app_desc) between 500 and 1000 then 'Medium'
            else 'Long'
       end as description_length_bucket,
       avg(A.user_rating) as average_ratings

from 
	AppleStore as A
join applestore_description_combined as b
on A.id = b.id

group by description_length_bucket
order by average_ratings desc
-- Long= 3.85; Medium = 3.23; Short = 2.53;
-- The longer the description the better the reviews


--Check the top rated apps for each genre
SELECT
	prime_genre,
    track_name,
    user_rating
from (
  		SELECT
  		prime_genre,
  		track_name,
  		user_rating,
  		RANK() OVER(PARTITION by prime_genre order by user_rating DESC, rating_count_tot DESC) as rank
  		from AppleStore
  	) as a 
where a.rank = 1

**FINAL RECOMMENDATIONS**

-- Paid apps have better ratings; 
	---The possibility of having financial income from purchasing the app means that there are no unpleasant advertisements that can ruin the user experience.
-- Apps supporting between 10 and 30 languages have better ratings; 
	---Having multiple languages to choose from expands the app's audience, but having too many languages to choose from doesn't seem to improve the overall experience.
-- Categories like Finance and Book apps have low ratings; 
	---This suggests that user needs are not being addressed. This could represent an opportunity for market penetration.
-- Apps with a longer description have better ratings; 
	---Users appreciate having a clear understanding of the app's features before downloading it. This creates clear expectations that increase user satisfaction.
-- A new app should aim for an average rating above 3.5;
-- Games and Entertainment have high competition;
	---This insight tells us that there is high volume in these categories, suggesting that the market is saturated, despite the high demand in the sector.
