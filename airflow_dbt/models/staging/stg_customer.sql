with source as (

    select * from {{ source('src_bigquery', 'customer') }}

),

stg_customer as (

    select
        customerid AS customer_id,
        personid AS person_id,
        storeid AS store_id,
        territoryid AS territory_id,
        accountnumber AS account_number,
    from source

)

select * from stg_customer