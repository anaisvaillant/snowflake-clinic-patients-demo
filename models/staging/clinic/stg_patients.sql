SELECT
id as patient_id,
birthdate as birth_date,
deathdate as death_date,
ssn,
drivers as driver_license,
prefix,
regexp_substr(first, '[A-Za-z]*') as first_name,
regexp_substr(last, '[A-Za-z]*') as last_name,
marital as marital_status,
race,
ethnicity,
gender,
address,
zip,
lat,
lon,
current_timestamp as last_updated_dts
FROM {{ source('clinic', 'patients') }}