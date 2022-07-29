{{
  config(
    materialized='incremental'
  )
}}

select
  {{ dbt_utils.surrogate_key(['patient', '"START"', 'encounter', 'code']) }} as procedure_id
, "START" as start_timestamp
, "STOP" as end_timestamp
, patient as patient_id
, encounter as encounter_id
, code
, "DESCRIPTION" as code_description
, base_cost
, reasoncode as reason_code
, reasondescription as reason_description 
, last_updated_dts
from {{ source('clinic', 'procedures') }}

{% if is_incremental() %}
  where procedure_id not in (select procedure_id from {{ this }})
{% endif %}