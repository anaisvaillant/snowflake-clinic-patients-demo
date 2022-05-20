select distinct
  patient_id
, last_value(encounter_id) over (partition by patient_id order by start_timestamp) as most_recent_encounter
from {{ ref('stg_encounters') }}