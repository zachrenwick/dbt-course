{{
  config(
    materialized='table'
  )
}}


with checkouts
as (select distinct session_id 
    from  {{ ref('stg_events') }}
    where event_type = 'checkout'),

product_actions_limited
as (select product_id,
           session_id,
           sum(add_to_cart_count) - sum(delete_from_cart_count) AS net_add_to_cart_count
    from  {{ ref('int_product_actions') }}
    group by 1,2)

SELECT  pal.product_id, 
checkouts.session_id,
count(*) as checkout_count
FROM checkouts 
INNER JOIN product_actions_limited pal on pal.session_id = checkouts.session_id
WHERE net_add_to_cart_count > 0
{{ dbt_utils.group_by(n=2) }}