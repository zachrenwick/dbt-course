{{
  config(
    materialized='view'
  )
}}

SELECT 
    id AS user_number_id,
    user_id,
    first_name,
    last_name,
    email,
    phone_number
FROM {{ source('src_public', 'users') }}