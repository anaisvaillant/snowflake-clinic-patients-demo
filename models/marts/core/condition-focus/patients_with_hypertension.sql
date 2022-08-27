{{
  config(
    tags=["contains_phi"]
  )
}}

select distinct
  pat.*
from cutini_demo.dbt_mcutini.stg_patients as pat
join {{ ref('stg_conditions') }} as con
  on pat.patient_id = con.patient_id
where 1=1 and con.condition_description = 'Hypertension'