{% macro client_number(table) %}

  {% set county_numbers = dbt_utils.get_column_values(
        table=ref('patient_locations'),
        column='county_number')
  %}

  {% for county_number in county_numbers %}
    {{ county_number }}
  {% endfor %}

{% endmacro %}