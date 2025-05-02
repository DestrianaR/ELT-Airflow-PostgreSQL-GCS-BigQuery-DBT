with source as (

    select * from {{ source('src_bigquery', 'salesreason') }}

),

stg_salesreason as (

    select
        salesreasonid AS sales_reason_id,
        salesreason AS sales_reason,
        reasontype AS reason_type

    from source

)

select * from stg_salesreason