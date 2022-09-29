{{
    config(
        schema = {% if {{this}}.city_name == ‘SALT LAKE CITY’ %} 'salt_lake_city' {% else %} ‘other_city’ {% endif %}
    )
}}

select 
  slc.city_name,
  dm.{{ dbt_utils.star(ref('encounters_for_patients_with_diabetes')) }}
from {{ ref('encounters_for_patients_with_diabetes') }} as dm
join {{ ref('patients_in_Salt_Lake_County') }} as slc
  on dm.patient_id = slc.patient_id
