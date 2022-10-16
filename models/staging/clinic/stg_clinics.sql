select
  id as clinic_id,
  name as clinic_name,
  address,
  city,
  state,
  zip,
  lat,
  lon
from {{ source('clinic',  'organizations') }}
where id = '46d53b17-836e-37cd-bb47-eb29effa06fc'