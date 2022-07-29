{% macro age_in_years(column_name, precision=2) %}
    floor(datediff(day, {{column_name}}, current_date()) / 365.25)::numeric(16, {{ precision }})
{% endmacro %}