select 
  "START" as start_date
, "STOP" as end_date
, patient as patient_id
, encounter as encounter_id
, code as condition_code
, "DESCRIPTION" as condition_description
, convert_timezone('America/Denver', current_timestamp) as last_updated_dts
from {{ source('clinic', 'conditions') }}