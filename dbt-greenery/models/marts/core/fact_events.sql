{{
  config(
    materialized='table'
  )
}}


{% set event_types = dbt_utils.get_column_values(table=ref('stg_events'), column='event_type') %}

SELECT 
session_id
    {% for event_type in event_types %}
    ,count(case when event_type = '{{event_type}}' then 1 end) as {{event_type}}_count
    {% endfor %}
    
FROM {{ ref('stg_events') }}
{{ dbt_utils.group_by(n=1) }}