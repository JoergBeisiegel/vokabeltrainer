SELECT
	source.concept_number as source_concept_number, 
	source.term_id as source_term_id, 
	source.term_value as source_term_value,
	source.language_code_number as source_language_code_number,
	
	target.concept_number as target_concept_number, 
	target.term_id as target_term_id, 
	target.term_value as target_term_value,
	target.language_code_number as target_language_code_number
FROM terms as source
INNER JOIN terms as target
ON source.concept_number = target.concept_number
AND 
source.language_code_number = 6
AND
target.language_code_number = 1

-- `terms`.`concept_number` IN (1, 2,4);
;

-- Alternative
SELECT distinct t.concept_number, t.language_code_number, s.language_code_number  
FROM terms t 
left JOIN terms s ON t.concept_number = s.concept_number 
AND t.language_code_number = 6
AND s.language_code_number = 1

SELECT distinct t.concept_number, t.language_code_number, s.language_code_number  
FROM terms t 
JOIN terms s ON t.concept_number = s.concept_number 
AND t.language_code_number = 6
AND s.language_code_number = 1

/*
CREATE TEMPORARY TABLE temp1 ENGINE=MEMORY 
as
(
	SELECT distinct c.concept_id, t.language_code_number, s.language_code_number  
	FROM 
	concepts c
	left JOIN terms t ON c.concept_id = t.concept_number 
	AND t.language_code_number = 6
	left JOIN terms s ON c.concept_id = s.concept_number 
	AND s.language_code_number = 1
	WHERE 
		attribute_number IS NULL
	LIMIT 8000000
);

*/

