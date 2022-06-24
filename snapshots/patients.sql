{% snapshot patients_snapshot %}

{{
    config(
      target_database='cutini_demo',
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='last_updated_dts'
    )
}}

select * from {{ source('clinic', 'patients') }}

{% endsnapshot %}