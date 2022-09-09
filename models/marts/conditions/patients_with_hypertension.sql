{{
  config(
    tags=["contains_phi"]
  )
}}

select distinct
  pat.patient_id
from cutini_demo.dbt_mcutini.stg_patients as pat
join {{ ref('stg_conditions') }} as con
  on pat.patient_id = con.patient_id
where con.condition_description = 'Hypertension'
