with source as (

    select * from {{ source('src_bigquery', 'salesorderdetail') }}

),

stg_salesorderdetail as (

    select
        salesorderid AS sales_order_id,
        salesorderdetailid AS sales_order_detail_id,
        carriertrackingnumber AS carrier_tracking_number,
        orderqty AS order_quantity,
        productid AS product_id,
        specialofferid AS special_offer_id,
        {{ convert_to_float('unitprice') }} AS unit_price,
        {{ convert_to_float('unitpricediscount') }} AS unit_price_discount,
        linetotal AS line_total

    from source

)

select * from stg_salesorderdetail