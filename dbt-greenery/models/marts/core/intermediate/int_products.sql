{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_id,
    name as product_name
FROM {{ ref('stg_products') }}