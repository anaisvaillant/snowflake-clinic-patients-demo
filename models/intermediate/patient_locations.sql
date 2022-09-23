select 
  p.patient_id,
  p.first_name,
  p.last_name,
  p.zip,
  z.countynbr as county_number,
  z.name as city_name
from {{ ref('stg_patients') }} as p
left join {{ ref('Utah_ZIP_Code_Areas') }} as z
  on p.zip = z.zip5
  