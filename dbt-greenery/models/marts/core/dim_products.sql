{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_id,
    product_name 
FROM {{ ref('int_products') }}