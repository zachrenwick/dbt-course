{{
  config(
    materialized='table'
  )
}}

SELECT 
user_id,
first_name,
last_name,
email,
phone_number
FROM {{ ref('stg_users') }}