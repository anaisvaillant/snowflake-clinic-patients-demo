select
{{ dbt_utils.surrogate_key(['patient', '"START"', 'encounter', 'code']) }} as procedure_id,
"START" as start_timestamp,
"STOP" as end_timestamp,
patient as patient_id,
encounter as encounter_id,
code as procedure_code,
"DESCRIPTION" as procedure_description,
base_cost,
reasoncode as reason_code,
reasondescription as reason_description 
from {{ source('clinic', 'procedures') }}