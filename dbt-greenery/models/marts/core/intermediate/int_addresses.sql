{{
  config(
    materialized='table'
  )
}}

SELECT 
    address_id,
    address,
    zipcode,
    state,
    country
FROM {{ ref('stg_addresses') }}