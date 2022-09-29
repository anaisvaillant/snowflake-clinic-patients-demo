select 
  patient_id,
  first_name,
  last_name, 
  city_name
from {{ ref('patient_locations') }}
where county_number = 18
