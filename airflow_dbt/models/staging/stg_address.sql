with source as (

    select * from {{ source('src_bigquery', 'address') }}

),

renamed as (

    select
        addressid,
        addressline1,
        addressline2,
        city,
        stateprovinceid,
        postalcode,
        spatiallocation

    from source

)

select * from renamed