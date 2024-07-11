with source as (

    select * from {{ source('src_bigquery', 'businessentityaddress') }}

),
renamed as (

    select
        addresstypeid,
        businessentityid,
        addressid
    from source
)
    
select * from renamed