select distinct
  patient_id
, last_value(encounter_id) over (partition by patient_id order by start_timestamp) as most_recent_encounter_id
, start_timestamp
from {{ ref('stg_encounters') }}