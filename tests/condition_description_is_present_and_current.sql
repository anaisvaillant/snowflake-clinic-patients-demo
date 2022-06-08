select *
from {{ ref('high_cost_patients_with_conditions') }}
where condition_description is null 
   or end_date is not null