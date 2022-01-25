WITH vacancy_data(month, vacancy_count) AS (
	SELECT
		EXTRACT(MONTH FROM creation_date) AS month,
		COUNT(vacancy_id) AS vacancy_count
	FROM vacancy
	GROUP BY month
),
resume_data(month, resume_count) AS (
	SELECT 
		EXTRACT(MONTH FROM creation_date) AS month,
		COUNT(resume_id) AS resume_count
	FROM resume
	GROUP BY month
)
(SELECT 
	'vacancy' AS type,
	month,
 	vacancy_count
FROM vacancy_data
ORDER BY vacancy_count DESC
LIMIT 1)
UNION
(SELECT
	'resume' as type,
	month,
	resume_count
FROM resume_data
ORDER BY resume_count DESC
LIMIT 1);
