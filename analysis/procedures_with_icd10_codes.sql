select 
  p.procedure_id, 
  p.start_timestamp,
  p.end_timestamp,
  p.patient_id,
  p.encounter_id,
  p.procedure_code as snomed_code,
  p.procedure_description as snomed_description,
  c.map_target as icd10_code,
  c.map_target_name as icd10_description
from {{ ref('stg_procedures') }} as p
join {{ ref('snomed_crosswalk') }} as c
  on p.procedure_code = c.referenced_component_id