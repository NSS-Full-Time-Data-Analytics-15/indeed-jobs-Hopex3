--1.How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs;
      --Answer. 1793

--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;
       --Answer. EXXON MOBILE

--3. 	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(*) 
FROM data_analyst_jobs
WHERE location ='TN'
   OR location = 'KY';

   -- OR--
   
SELECT COUNT(*), location
FROM data_analyst_jobs
WHERE location IN ('TN','KY')
   GROUP BY location;
   
--4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'
  AND star_rating > 4;
  --Answer. 3 postings
  
 --5. How many postings in the dataset have a review count between 500 and 1000?
 SELECT COUNT(*)
 FROM data_analyst_jobs
 WHERE review_count 
   BETWEEN 500 AND 1000;
  --Answer. 151 postings
  
 --6.Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
 SELECT AVG(star_rating) AS avg_rating, location AS state
 FROM data_analyst_jobs
 WHERE location IS NOT NULL 
  AND star_rating IS NOT NULL
 GROUP BY location
 ORDER BY avg_rating DESC;
 --Answer. Nebraska at 4.2 

 --7. Select unique job titles from the data_analyst_jobs table. How many are there?
 SELECT COUNT(DISTINCT title)
 FROM data_analyst_jobs;
--Answer. 881

 --8. How many unique job titles are there for California companies?
 SELECT COUNT(DISTINCT title)
 FROM data_analyst_jobs
 Where location = 'CA';
--Answer. 230

 --9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT DISTINCT company, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
 AND company IS NOT NULL;
--9b.
SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE review_count > 5000
 AND company IS NOT NULL;
 --Answer. 40

--10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT DISTINCT company, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
 AND company IS NOT NULL
ORDER BY star_rating DESC;

--10b. 
SELECT MAX(DISTINCT company),star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
 AND company IS NOT NULL
 GROUP BY star_rating
 ORDER BY star_rating DESC;
 -- Answer. Unilever at 4.2 star rating

 --11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

--11b. 
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';
 -- Answer. 1636

 --12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT COUNT(title) 
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
 AND title NOT LIKE '%Analytics%';
 
 --ANSWER. 39