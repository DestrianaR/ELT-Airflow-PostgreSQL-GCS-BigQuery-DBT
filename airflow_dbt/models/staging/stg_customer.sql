with source as (

    select * from {{ source('src_bigquery', 'customer') }}

),

renamed as (

    select
        customerid,
        personid,
        storeid,
        territoryid,
        accountnumber,
    from source

)

select * from renamed