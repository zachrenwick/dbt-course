{{
  config(
    materialized='table'
  )
}}

SELECT split_part(page_url, 'https://greenary.com/product/', 2) AS product_id
	,session_id
	,DATE (created_at) AS checkout_date
	,EXTRACT(HOUR FROM created_at) AS checkout_hour
	,count(*) AS checkout_count
FROM {{ ref('stg_events') }}
WHERE event_type = 'checkout'
	AND page_url LIKE 'https://greenary.com/product/%'
	AND created_at IS NOT NULL
{{ dbt_utils.group_by(n=4) }}