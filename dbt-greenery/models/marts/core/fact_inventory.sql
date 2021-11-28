{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_id,
    quantity 
FROM {{ ref('int_inventory') }}