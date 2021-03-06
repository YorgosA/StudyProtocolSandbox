﻿SELECT 'Lipid Lowering Agents', COUNT(*), Null, Null, Null, Null, Null, Null, Null FROM (
	SELECT DISTINCT c.person_id FROM
		(SELECT * FROM
			(SELECT A.person_id, A.cohort_start_date, A.drug_exposure_start_date, A.drug_concept_id, concept_ancestor.ancestor_concept_id, concept_ancestor.descendant_concept_id FROM
				(SELECT * FROM @target_database_schema.@target_cohort_table LEFT JOIN @cdm_database_schema.drug_exposure ON (@target_cohort_table.subject_id = drug_exposure.person_id)) A
			LEFT JOIN @cdm_database_schema.concept_ancestor ON (A.drug_concept_id=concept_ancestor.descendant_concept_id) WHERE cohort_definition_id=2 or cohort_definition_id=3) b
		WHERE b.drug_exposure_start_date <= b.cohort_start_date
		)c
	WHERE c.ancestor_concept_id = 21601853 ) d 

