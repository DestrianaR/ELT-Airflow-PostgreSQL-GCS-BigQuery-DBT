with source as (

    select * from {{ source('src_bigquery', 'salesreason') }}

),

renamed as (

    select
        salesreasonid,
        salesreason,
        reasontype

    from source

)

select * from renamed