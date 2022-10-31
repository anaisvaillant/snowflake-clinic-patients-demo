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
where id = 'ed6b5dd5-a7a7-3b27-a095-8cdfce3c13dc'