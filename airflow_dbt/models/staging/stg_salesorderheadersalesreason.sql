with source as (

    select * from {{ source('src_bigquery', 'salesorderheadersalesreason') }}

),

stg_salesorderheadersalesreason as (

    select
        salesorderid AS sales_order_id,
        salesreasonid AS sales_reason_id

    from source

)

select * from stg_salesorderheadersalesreason