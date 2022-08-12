select
  patient_id
, {{ dbt_utils.pivot(
    'encounter_class'
   , dbt_utils.get_column_values(ref('stg_encounters'), 'encounter_class')
   ) }}
from {{ ref('stg_encounters') }} 
join {{ ref('patients_with_diabetes') }} using (patient_id)
group by patient_id 