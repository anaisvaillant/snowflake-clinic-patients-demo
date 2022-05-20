/* We only want to pull encounters that have matches with the conditions data that we have. 
So it's important to join here to the stg_conditions model in order to filter out extra data. */

select 
  id as encounter_id
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
from {{ source('clinic', 'encounters') }} as enc
join {{ ref('stg_conditions') }} as con on enc.id = con.encounter_id