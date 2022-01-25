SELECT 
	vacancy.vacancy_id, 
	vacancy.position_name AS title
FROM vacancy 
INNER JOIN response ON vacancy.vacancy_id = response.vacancy_id
WHERE EXTRACT(DAY FROM response.creation_date - vacancy.creation_date) <= 7
GROUP BY vacancy.vacancy_id, vacancy.position_name
HAVING COUNT(response.resume_id) > 5
ORDER BY vacancy_id;
