select
  pat.patient_id
, pat.last_name
, sum(enc.total_claim_cost) as total_cost
from {{ ref('stg_patients') }} pat
join {{ ref('stg_encounters') }} enc 
  on pat.patient_id = enc.patient_id 
where pat.death_date is null /* filtering out deceased patients */
group by pat.patient_id, pat.last_name
having sum(enc.total_claim_cost) > 2500