{{
  config(
    materialized='table'
  )
}}

SELECT 
    
FROM {{ source('stage', 'user') }}