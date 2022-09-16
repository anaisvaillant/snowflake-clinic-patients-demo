{% test all_male_patients(model, column_name) %}

{{
    config(
        store_failures = true,
        alias = 'test_for_all_male_patients'
    )
}}

select {{ column_name }}
from {{ model }}
where upper({{ column_name }}) not in ('M', 'MALE')

{% endtest %}