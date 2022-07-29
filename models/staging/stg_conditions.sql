{{
  config(
    materialized='incremental'
  )
}}

select
  {{ dbt_utils.surrogate_key(['patient', 'encounter', 'code', '"DESCRIPTION"']) }} as condition_id
, "START" as start_date
, "STOP" as end_date
, patient as patient_id
, encounter as encounter_id
, code as condition_code
, "DESCRIPTION" as condition_description
, last_updated_dts
from {{ source('clinic', 'conditions') }}

{% if is_incremental() %}
  where condition_id not in (select condition_id from {{ this }})
{% endif %}