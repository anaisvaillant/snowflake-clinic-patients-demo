select distinct
  patient_id
, last_value(encounter_id) over (partition by patient_id order by start_timestamp) as most_recent_encounter_id
, last_value(start_timestamp) over (partition by patient_id order by start_timestamp) as most_recent_encounter_start
from {{ ref('stg_encounters') }}