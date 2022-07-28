select distinct
  {{ dbt_utils.surrogate_key(['id', '"START"', 'organization']) }} as encounter_id
, "START" as start_timestamp
, "STOP" as end_timestamp
, patient as patient_id
, organization as organization_id
, "PROVIDER" as provider_id
, payer as payer_id
, encounterclass as encounter_class
, code as encounter_code
, "DESCRIPTION" as encounter_description
, "BASE_ENCOUNTER_COST"
, total_claim_cost
, payer_coverage
, reasoncode as reason_code
, reasondescription as reason_description
from {{ source('clinic', 'encounters') }}