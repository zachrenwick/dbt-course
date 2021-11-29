{{
  config(
    materialized='table'
  )
}}

WITH date_spine AS (

  {{ dbt_utils.date_spine(
      start_date="to_date('01/01/2020', 'mm/dd/yyyy')",
      datepart="day",
      end_date="to_date('12/31/2021', 'mm/dd/yyyy')"
     )
  }}

)

    SELECT
      date_day,
      EXTRACT( YEAR FROM date_day)       AS year
    FROM date_spine