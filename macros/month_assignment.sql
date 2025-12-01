{% macro month_assignment(date_column) %}
    case
        when {{ date_column }} is null then null
        when extract(day from {{ date_column }}) >= 26
            then date_trunc('month', {{ date_column }} + interval '1 month')
        else date_trunc('month', {{ date_column }})
    end
{% endmacro %}
