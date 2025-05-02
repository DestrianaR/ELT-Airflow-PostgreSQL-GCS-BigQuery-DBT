with source as (

    select * from {{ source('src_bigquery', 'businessentityaddress') }}

),
stg_businessentityaddress as (

    select
        addresstypeid AS address_type_id,
        businessentityid AS business_entity_id,
        addressid AS address_id
    from source
)
    
select * from stg_businessentityaddress