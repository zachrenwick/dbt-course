{{
  config(
    materialized='table'
  )
}}

WITH date_spine AS (

  {{ dbt_utils.date_spine(
      start_date="DATE('2020-01-01')",
      datepart="day",
      end_date="CURRENT_DATE()"
     )
  }}

)

    SELECT
      date_day,
      1 as one
    FROM date_spine