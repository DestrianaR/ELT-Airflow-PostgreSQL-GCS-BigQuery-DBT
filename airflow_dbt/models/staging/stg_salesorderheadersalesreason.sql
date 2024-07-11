with source as (

    select * from {{ source('src_bigquery', 'salesorderheadersalesreason') }}

),

renamed as (

    select
        salesorderid,
        salesreasonid

    from source

)

select * from renamed