{% macro age_in_months(column_name, precision=2) %}
    floor(datediff(month, {{column_name}}, current_date()))::numeric(16, {{ precision }})
{% endmacro %}