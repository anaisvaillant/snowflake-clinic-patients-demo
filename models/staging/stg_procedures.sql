{{
  config(
    materialized='incremental',
    unique_key='procedure_id'
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
  where last_updated_dts >= (select max(last_updated_dts) from {{ this }})
{% endif %}