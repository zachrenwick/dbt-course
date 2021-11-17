{% snapshot promos_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='promo_id',
      strategy='check',
      check_cols=['discout', 'status']
    )
  }}

  SELECT * 
  FROM {{ source('stage', 'promos') }}

{% endsnapshot %}