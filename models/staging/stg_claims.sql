-- This needs to be an incremental load because it is a large table

{{
  config(
    materialized='incremental'
  )
}}

select 
  id as claim_id
, patientid as patient_id
, providerid as provider_id
, primarypatientinsuranceid as primary_patient_insurance_id
, secondarypatientinsuranceid as secondary_patient_insurance_id
, departmentid as department_id
, patientdepartmentid as patient_department_id
, diagnosis1 as primary_diagnosis_code
, diagnosis2 as secondary_diagnosis_code
, diagnosis3 as tertiary_diagnosis_code
, referringproviderid as referring_provider_id
, appointmentid as appointment_id
, currentillnessdate as current_illness_date
, servicedate as service_date
, supervisingproviderid as supervising_provider_id
, status1 as claim_status
, lastbilleddate as last_billed_date
, last_updated_dts
from {{ source('clinic', 'claims') }}

{% if is_incremental() %}

  where claim_id not in (select claim_id from {{ this }})

{% endif %}