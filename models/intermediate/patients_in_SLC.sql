select 
  first_name,
  last_name, 
  city_name
from {{ ref('patient_locations') }}
where city_name = 'SALT LAKE CITY'
