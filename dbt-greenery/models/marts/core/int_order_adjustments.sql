{{
  config(
    materialized='table'
  )
}}

SELECT
  order_id,
  SUM(amount) AS order_total_adjustment
FROM {{ ref('stg_order_adjustments') }}
WHERE was_completed
GROUP BY 1