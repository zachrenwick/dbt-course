{% snapshot orders_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='order_id',

      strategy='timestamp',
      updated_at='created_at'
    )
  }}

  SELECT * 
  FROM {{ source('src_public', 'orders') }}

{% endsnapshot %}