{{
  config(
    materialized='table'
  )
}}

SELECT 
user_id,
count(distinct order_id) AS order_count,
--promo count
SUM(order_cost) AS total_customer_cost,
SUM(shipping_cost) AS total_shipping_cost,
SUM(order_total) AS total_customer_revenue,
count of products purchased
first_order_date
most_recent_order_date

FROM  {{ ref('dim_users') }}
LEFT JOIN {{ ref('int_order_details') }} USING (user_id)