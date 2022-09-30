{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- elif custom_schema_name == 'reference_data' -%}

        {{ default_schema }}

    {%- else -%}

        {{ default_schema }}_{{'client_'}}{{ var('client_number') }}

    {%- endif -%}

{%- endmacro %}