{{
  config(
    materialized='table'
  )
}}

{% set event_types = dbt_utils.get_column_values(table=ref('stg_events'), column='event_type') %}



SELECT 
  split_part(page_url, 'https://greenary.com/product/', 2) as product_id,
  session_id
  {% for event_type in event_types %}
  ,count(case when event_type = '{{event_type}}' then 1 end) as {{event_type}}_count
  {% endfor %} 

FROM {{ ref('stg_events') }}
WHERE       page_url like 'https://greenary.com/product/%'
        and created_at is not null

{{ dbt_utils.group_by(n=2) }}