WITH vacancy_data(id, salary, description, employer_id, position_name, area_id, creation_date) AS (
	SELECT 
		generate_series(1, 10000) AS id,
		ROUND((RANDOM() * 100000)::INT, -3) AS salary,
		md5(RANDOM()::TEXT) AS description,
		(RANDOM() * 20)::INT AS employer_id,
		md5(RANDOM()::TEXT) AS position_name,
		(RANDOM() * 20)::INT AS area_id,
		timestamp '2022-01-01' + RANDOM() * INTERVAL '12 months' AS creation_date
)
INSERT INTO vacancy(compensation_from, compensation_to, description, employer_id, position_name, area_id, creation_date)
SELECT 
	salary, 
	salary + ROUND((RANDOM() * 100000)::INT, -4),
	description,
	employer_id,
	position_name, 
	area_id, 
	creation_date
FROM vacancy_data;


WITH resume_data(id, salary, description, employee_id, position_name, area_id, creation_date) AS (
	SELECT 
		generate_series(1, 100000) AS id,
		ROUND((RANDOM() * 100000)::INT, -3) AS salary,
		md5(RANDOM()::TEXT) AS description,
		(RANDOM() * 20)::INT AS employer_id,
		md5(RANDOM()::TEXT) AS position_name,
		(RANDOM() * 20)::INT AS area_id,
		timestamp '2021-01-01' + RANDOM() * INTERVAL '12 months' AS creation_date
)
INSERT INTO resume(compensation, description, employee_id, position_name, area_id, creation_date)
SELECT 
	salary, 
	description,
	employee_id,
	position_name, 
	area_id, 
	creation_date
FROM resume_data;


WITH response_data(id, resume_id, vacancy_id, creation_date) AS (
	SELECT 
		generate_series(1, 300000) AS id,
		(RANDOM() * 99999)::INT + 1 AS resume_id,
		(RANDOM() * 9999)::INT + 1 AS vacancy_id,
		timestamp '2022-01-01' + RANDOM() * INTERVAL '12 months' AS creation_date
)
INSERT INTO response(resume_id, vacancy_id, creation_date)
SELECT 
	resume_id, 
	vacancy_id,
	creation_date
FROM response_data
on conflict do nothing;
