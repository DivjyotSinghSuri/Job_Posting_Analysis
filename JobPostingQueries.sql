-- Project: Business Analyst Job Postings Analysis
-- Author: Divjyot Singh Suri
-- Date: 31st August 2025

-- 1. Check the dataset
SELECT * FROM `my_dataset.cleaned_table`;

-- 2. Top 10 most frequently required skills
SELECT
  TRIM(skill) AS skill,
  COUNT(*) AS frequency
FROM `my_dataset.cleaned_table`,
UNNEST(SPLIT(Extracted_skills, ',')) AS skill
GROUP BY skill
ORDER BY frequency DESC
LIMIT 10;

-- 3. Location with the highest number of job postings
SELECT 
  Extracted_Location, 
  COUNT(*) AS location_count
FROM `my_dataset.cleaned_table`
GROUP BY Extracted_Location
ORDER BY location_count DESC
LIMIT 1;

-- Answer - New York

-- 4. Top 7 locations by job postings
SELECT 
  Extracted_Location, 
  COUNT(*) AS location_count
FROM `my_dataset.cleaned_table`
GROUP BY Extracted_Location
ORDER BY location_count DESC
LIMIT 7;

-- 5. Number of postings per experience level (excluding 'Not Applicable')
SELECT
  experienceLevel,
  COUNT(*) AS role_count
FROM `my_dataset.cleaned_table`
WHERE experienceLevel != 'Not Applicable'
GROUP BY experiencelevel
ORDER BY role_count DESC;

-- 6. Top 10 companies by job postings
SELECT companyName,
       COUNT(*) AS Job_openings
FROM `my_dataset.cleaned_table`
GROUP BY companyName
ORDER BY Job_openings DESC
LIMIT 10;

-- 7. Job postings distribution by year and month
SELECT
  EXTRACT(YEAR FROM DATE(publishedAt)) AS year,
  EXTRACT(MONTH FROM DATE(publishedAt)) AS month,
  COUNT(*) AS job_count
FROM `my_dataset.cleaned_table`
GROUP BY year, month
ORDER BY year, month;

-- 8. Month with the highest number of postings
SELECT 
  EXTRACT(YEAR FROM DATE(publishedAt)) AS year,
  EXTRACT(MONTH FROM DATE(publishedAt)) AS month,
  COUNT(*) AS job_count
FROM `my_dataset.cleaned_table`
GROUP BY year, month
ORDER BY job_count DESC
LIMIT 1;

-- Answer - August 2024(109 Postings)

-- 9. Top 5 industries/sectors hiring the most
SELECT sector,
       COUNT(*) AS Job_postings
FROM `my_dataset.cleaned_table`
GROUP BY sector
ORDER BY Job_postings DESC
LIMIT 5;

-- 10. Distribution of contract types
SELECT contractType,
       COUNT(*) AS TotalNUM
FROM `my_dataset.cleaned_table`
GROUP BY contractType;

-- 11. Number of postings with 200+ applicants
SELECT COUNT(*) AS Postings_with_200plusapplicants
FROM `my_dataset.cleaned_table`
WHERE applicationsCount = 'Over 200 applicants';

-- Answer - 105

-- 12. Locations of postings with 200+ applicants
SELECT Extracted_Location, COUNT(*) AS Postings_with_200plusapplicants
FROM `my_dataset.cleaned_table`
WHERE applicationsCount = 'Over 200 applicants'
GROUP BY Extracted_Location
ORDER BY Postings_with_200plusapplicants DESC;

-- 13. 15 sectors recruiting the least number of Business Analysts
SELECT sector, COUNT(*) AS Postings
FROM `my_dataset.cleaned_table`
GROUP BY sector
ORDER BY Postings ASC
LIMIT 15;
