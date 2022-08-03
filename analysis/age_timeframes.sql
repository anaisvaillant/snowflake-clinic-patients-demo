select patient_id, 
       birth_date, 
       {{age_in_years('birth_date')}} as age_in_years, 
       {{age_in_months('birth_date')}} as age_in_months
from {{ ref('stg_patients') }}