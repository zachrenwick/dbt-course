{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_id,
    quantity 
FROM {{ ref('stg_products') }}