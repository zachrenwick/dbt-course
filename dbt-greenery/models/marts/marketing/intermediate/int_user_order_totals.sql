{{
  config(
    materialized='table'
  )
}}

SELECT 
user_id,
order count
promo count
order total
shipping total
count of products purchased
first_order_date
most_recent_order_date

FROM  {{ ref('dim_users') }}
LEFT JOIN {{ ref('int_order_details') }}