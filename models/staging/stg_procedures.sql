select 
  "START" as start_timestamp
, "STOP" as end_timestamp
, patient as patient_id
, encounter as encounter_id
, code
, "DESCRIPTION" as code_description
, base_cost
, reasoncode as reason_code
, reasondescription as reason_description 
, convert_timezone('America/Denver', current_timestamp) as last_updated_dts
from {{ source('clinic', 'procedures') }}