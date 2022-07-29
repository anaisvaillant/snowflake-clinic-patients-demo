select distinct
  pat.patient_id
, pat.last_name
, pat.total_cost
, mre.most_recent_encounter_id
, con.condition_description
, con.end_date
from {{ ref('high_cost_patients') }} as pat
join {{ ref('most_recent_encounter') }} as mre
  on pat.patient_id = mre.patient_id


