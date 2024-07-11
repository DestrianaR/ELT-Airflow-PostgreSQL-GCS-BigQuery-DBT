-- Macro to convert a comma-separated string to float
{% macro convert_to_float(comma_string) %}

  CAST(REPLACE({{ comma_string }}, ',', '.') AS FLOAT64)

{% endmacro %}