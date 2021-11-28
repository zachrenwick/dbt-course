{{
  config(
    materialized='table'
  )
}}

SELECT 
    user_number_id,
    user_id,
    first_name,
    last_name,
    email,
    phone_number    
FROM {{ref('int_users')}}