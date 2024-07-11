with source as (

    select * from {{ source('src_bigquery', 'salesorderheader') }}

),

renamed as (

    select
        salesorderid,
        revisionnumber,
        TIMESTAMP(orderdate) AS orderdate,
        TIMESTAMP(duedate) AS duedate,
        TIMESTAMP(shipdate) AS shipdate,
        status,
        onlineorderflag,
        salesordernumber,
        purchaseordernumber,
        accountnumber,
        customerid,
        salespersonid,
        territoryid,
        billtoaddressid,
        shiptoaddressid,
        shipmethodid,
        creditcardid,
        creditcardapprovalcode,
        currencyrateid,
        {{ convert_to_float('subtotal') }} AS subtotal,
        {{ convert_to_float('taxamt') }} AS taxamt,
        {{ convert_to_float('freight') }} AS freight,
        {{ convert_to_float('totaldue') }} AS totaldue,
        comment

    from source

)

select * from renamed