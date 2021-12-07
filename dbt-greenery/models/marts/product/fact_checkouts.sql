{{
  config(
    materialized='table'
  )
}}

SELECT 
  split_part(page_url, 'https://greenary.com/product/', 2) as product_id,
  session_id,
  DATE(created_at) as checkout_date,
  EXTRACT(HOUR FROM created_at) as checkout_hour,
  count(*) as checkout_count
FROM {{ ref('stg_events') }}
WHERE event_type = 'checkout'
{{ dbt_utils.group_by(n=4) }}