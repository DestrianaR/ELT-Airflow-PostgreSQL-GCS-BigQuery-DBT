with source as (

    select * from {{ source('src_bigquery', 'salesorderheader') }}

),

stg_salesorderheader as (

    select
        salesorderid AS sales_order_id,
        revisionnumber AS revision_number,
        DATE(orderdate) AS order_date,
        DATE(duedate) AS due_date,
        DATE(shipdate) AS ship_date,
        status,
        onlineorderflag AS online_order_flag,
        salesordernumber AS sales_order_number,
        purchaseordernumber AS purchase_order_number,
        accountnumber AS account_number,
        customerid AS customer_id,
        salespersonid AS sales_person_id,
        territoryid AS territory_id,
        billtoaddressid AS bill_to_address_id,
        shiptoaddressid AS ship_to_address_id,
        shipmethodid AS ship_method_id,
        creditcardid AS credit_card_id,
        creditcardapprovalcode AS credit_card_approval_code,
        currencyrateid AS currency_rate_id,
        {{ convert_to_float('subtotal') }} AS subtotal,
        {{ convert_to_float('taxamt') }} AS tax_amt,
        {{ convert_to_float('freight') }} AS freight,
        {{ convert_to_float('totaldue') }} AS total_due,
        comment


    from source

)

select * from stg_salesorderheader