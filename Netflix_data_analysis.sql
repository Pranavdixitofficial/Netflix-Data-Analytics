use netflix_data;

-- Retrieves the top 5 countries with the highest number of TV Shows.  
-- Filters records where type is 'TV Show' and country is not NULL.  
-- Groups the data by country and orders in descending order of total count.  
SELECT country, COUNT(*) AS total_tv_shows  
FROM netflix_titles  
WHERE type = 'TV Show' AND country IS NOT NULL  
GROUP BY country  
ORDER BY total_tv_shows DESC  
LIMIT 5;  

-- Finds the top 5 countries that have added the most content in the last 5 years.  
-- Filters records where release year is within the last 5 years from the current year.  
-- Groups by country and orders in descending order of recent titles count.  
SELECT country, COUNT(*) AS recent_titles  
FROM netflix_titles  
WHERE country IS NOT NULL AND release_year >= YEAR(CURDATE()) - 5  
GROUP BY country  
ORDER BY recent_titles DESC  
LIMIT 5;  

-- Identifies the top 10 countries with the most diverse genre availability.  
-- Counts distinct genres under "listed_in" for each country.  
-- Groups by country and orders in descending order of unique genre count.  
SELECT country, COUNT(DISTINCT listed_in) AS unique_genres  
FROM netflix_titles  
WHERE country IS NOT NULL  
GROUP BY country  
ORDER BY unique_genres DESC  
LIMIT 10;  

-- Finds the most frequently featured director by counting the number of titles they have directed.  
-- Filters out NULL director values and groups records by director.  
-- Orders by total title count in descending order and limits to the top 1.  
SELECT director, COUNT(*) AS total_titles  
FROM netflix_titles  
WHERE director IS NOT NULL  
GROUP BY director  
ORDER BY total_titles DESC  
LIMIT 1;  

-- Lists the top 5 TV shows with the highest number of seasons.  
-- Extracts numeric values from "duration" by removing the word 'Season'.  
-- Orders by the converted numeric value in descending order.  
SELECT title, duration  
FROM netflix_titles  
WHERE type = 'TV Show'  
ORDER BY CAST(REPLACE(duration, ' Season', '') AS UNSIGNED) DESC  
LIMIT 5;  

-- Counts the number of titles under each rating category.  
-- Groups by rating and orders the result in descending order of total title count.  
SELECT rating, COUNT(*) AS total_titles  
FROM netflix_titles  
WHERE rating IS NOT NULL  
GROUP BY rating  
ORDER BY total_titles DESC;  
