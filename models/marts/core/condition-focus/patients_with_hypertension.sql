{{
  config(
    tags=["contains_phi"]
  )
}}

select distinct
  pat.*
from cutini_demo.dbt_mcutini.stg_patients as pat
join cutini_demo.dbt_mcutini_stg_conditions as con
  on pat.patient_id = con.patient_id
where con.condition_description = 'Hypertension'