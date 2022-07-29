{{
  config(
    materialized='incremental'
  )
}}

select
  id as patient_id
, birthdate as birth_date
, deathdate as death_date
, ssn
, drivers as driver_license
, passport
, prefix
, regexp_substr(first, '[A-Za-z]*') as first_name
, regexp_substr(last, '[A-Za-z]*') as last_name
, marital as marital_status
, race
, ethnicity
, gender
, last_updated_dts
from {{ source('clinic', 'patients') }}

{% if is_incremental() %}
  where patient_id not in (select patient_id from {{ this }})
{% endif %}