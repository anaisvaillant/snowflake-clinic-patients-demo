select 
  pat.patient_id
, pat.last_name
, pat.total_cost
, enc.most_recent_encounter
, con.condition_description
, con.end_date
from {{ ref('high_cost_patients') }} as pat
join {{ ref('most_recent_encounter') }} as enc
  on pat.patient_id = enc.patient_id
left join {{ ref('stg_conditions') }} as con
  on enc.most_recent_encounter = con.encounter_id
