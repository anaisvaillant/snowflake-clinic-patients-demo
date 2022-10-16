select
  first_name,
  last_name,
  address,
  lon,
  lat,
  distance
from {{ ref('patients_distances_from_clinics') }}
order by distance asc
limit 1