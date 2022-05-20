select 
  pat.*
from {{ ref('stg_patients') }} as pat
join {{ ref('stg_conditions') }} as con
  on pat.patient_id = con.patient_id
where con.condition_description like '%diabetes%'