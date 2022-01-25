CREATE INDEX vacancy_compensation_from_and_to_index ON vacancy(compensation_from, compensation_to);
CREATE INDEX vacancy_position_name_and_area_id_index ON vacancy(position_name, area_id);
CREATE INDEX vacancy_position_name_index ON vacancy(position_name);

CREATE INDEX resume_compensation_index ON resume(compensation);
CREATE INDEX resume_position_name_and_area_id_index ON resume(position_name, area_id);
CREATE INDEX resume_position_name_index ON resume(position_name);
