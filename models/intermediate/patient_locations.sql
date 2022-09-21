select 
  p.first_name,
  p.last_name,
  p.zip,
  z.name as city_name
from {{ ref('stg_patients') }} as p
left join {{ ref('Utah_ZIP_Code_Areas') }} as z
  on p.zip = z.zip5
  