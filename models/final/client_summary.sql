{{
  config(
    schema = 'custom_schema'
  )
}}

select 
  patient_id,
  first_name,
  last_name, 
  city_name,
  zip
from {{ ref('patient_locations') }}
where county_number = {{ var('client_number') }}