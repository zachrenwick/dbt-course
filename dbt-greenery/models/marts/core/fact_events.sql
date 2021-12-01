{{
  config(
    materialized='table'
  )
}}

{% set event_types = ["add_to_cart", "checkout", "page_view", "delete_from_cart", "account_created", "package_shipped"] %}


SELECT 
session_id
    {% for event_type in event_types %}
    ,count(case when event_type = '{{event_type}}' then 1 end) as {{event_type}}_count
    {% endfor %}
    
FROM {{ ref('stg_events') }}
group by 1