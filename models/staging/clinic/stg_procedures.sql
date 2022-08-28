{{
  config(
    materialized='incremental',
    unique_key='procedure_id'
  )
}}

SELECT
{{ dbt_utils.surrogate_key(['patient', '"START"', 'encounter', 'code']) }} as procedure_id,
"START" as start_timestamp,
"STOP" as end_timestamp,
patient as patient_id,
encounter as encounter_id,
code as procedure_code,
"DESCRIPTION" as procedure_description,
base_cost,
reasoncode as reason_code,
reasondescription as reason_description,
current_date as last_updated_date
from {{ source('clinic', 'procedures') }}

{% if is_incremental() %}
  where etl_loaded_at_dts > (select max(last_updated_date) from {{ this }})
{% endif %}