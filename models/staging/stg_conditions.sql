{{
  config(
    materialized='incremental',
    unique_key=['patient_id', 'encounter_id', 'condition_code'],
    incremental_strategy='delete+insert'
  )
}}

select
  "START" as start_date
, "STOP" as end_date
, patient as patient_id
, encounter as encounter_id
, code as condition_code
, "DESCRIPTION" as condition_description
, last_updated_dts
from {{ source('clinic', 'conditions') }}

{% if is_incremental() %}
  where last_updated_dts >= (select max(last_updated_dts) from {{ this }})
{% endif %}