{{
  config(
    materialized='table'
  )
}}

SELECT 
  split_part(page_url, 'https://greenary.com/product/', 2) as product_id,
  DATE(created_at) as view_date,
  EXTRACT(HOUR FROM created_at) as view_hour,
  COUNT(*) as page_views 

FROM {{ ref('stg_events') }}
WHERE        event_type = 'page_view'
        and  page_url like 'https://greenary.com/product/%'
        and created_at is not null

GROUP BY    product_id,
            view_date,
            view_hour