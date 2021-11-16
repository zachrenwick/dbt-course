{{
  config(
    materialized='table'
  )
}}

SELECT 
    order_id,
    product_id,
    quantity
FROM {{ source('stage', 'order_items') }}