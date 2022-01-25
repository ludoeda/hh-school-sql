CREATE TABLE vacancy (
	vacancy_id SERIAL PRIMARY KEY,
	compensation_from INTEGER,
	compensation_to INTEGER,
	description TEXT,
	employer_id INTEGER NOT NULL,
	position_name VARCHAR(100) NOT NULL,
	area_id INTEGER,
	creation_date TIMESTAMP NOT NULL
);

CREATE TABLE resume (
	resume_id SERIAL PRIMARY KEY,
	creation_date TIMESTAMP NOT NULL,
	position_name VARCHAR(100) NOT NULL,
	employee_id INTEGER,
	area_id INTEGER,
	description TEXT,
	compensation INTEGER
);

CREATE TABLE response
(
    vacancy_id INTEGER NOT NULL,
    resume_id INTEGER NOT NULL,
    creation_date TIMESTAMP NOT NULL,
    FOREIGN KEY (vacancy_id) REFERENCES vacancy(vacancy_id),
    FOREIGN KEY (resume_id) REFERENCES resume(resume_id),
    PRIMARY KEY (vacancy_id, resume_id)
);

CREATE TABLE specialization
(
    specialization_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE vacancy_specialization
(
    specialization_id INTEGER NOT NULL,
    vacancy_id INTEGER NOT NULL,
    FOREIGN KEY specialization_id REFERENCES specialization(specialization_id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancy(vacancy_id),
    PRIMARY KEY (specialization_id, vacancy_id)
);

CREATE TABLE resume_specialization
(
    specialization_id INTEGER NOT NULL,
    resume_id INTEGER NOT NULL,
    FOREIGN KEY specialization_id REFERENCES specialization(specialization_id),
    FOREIGN KEY (resume_id) REFERENCES resume(resume_id),
    PRIMARY KEY (specialization_id, resume_id)
);
