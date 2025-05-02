with source as (

    select * from {{ source('src_bigquery', 'address') }}

),

stg_address as (

    select
        addressid AS address_id,
        addressline1 AS address_line1,
        addressline2 AS address_line2,
        city,
        stateprovinceid AS state_province_id,
        postalcode AS postal_code,
        spatiallocation AS spatial_location

    from source

)

select * from stg_address