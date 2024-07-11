with source as (

    select * from {{ source('src_bigquery', 'salesorderdetail') }}

),

renamed as (

    select
        salesorderid,
        salesorderdetailid,
        carriertrackingnumber,
        orderqty,
        productid,
        specialofferid,
        {{ convert_to_float('unitprice') }} AS unitprice,
        {{ convert_to_float('unitpricediscount') }} AS unitpricediscount,
        linetotal

    from source

)

select * from renamed