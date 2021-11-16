{{
  config(
    materialized='table'
  )
}}

SELECT 
    id AS user_number_id,
    user_id,
    first_name,
    last_name,
    email,
    phone_number
FROM {{ source('stage', 'users') }}