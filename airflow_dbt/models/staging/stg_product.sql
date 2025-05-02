with source as (

    select * from {{ source('src_bigquery', 'product') }}

),

stg_product as (

    select
        productid AS product_id,
        productname AS product_name,
        productnumber AS product_number,
        makeflag AS make_flag,
        finishedgoodsflag AS finished_goods_flag,
        color,
        safetystocklevel AS safety_stock_level,
        reorderpoint AS re_order_point,
        {{ convert_to_float('standardcost') }} AS standard_cost,
        {{ convert_to_float('listprice') }} AS list_price,
        size,
        sizeunitmeasurecode AS size_unit_measure_code,
        weightunitmeasurecode AS weight_unit_measure_code,
        weight,
        daystomanufacture AS days_to_manufacture,
        productline AS product_line,
        class,
        style,
        productsubcategoryid AS product_subcategory_id,
        productmodelid AS product_model_id,
        sellstartdate AS sell_start_date,
        sellenddate AS sell_end_date,
        discontinueddate AS discontinued_date
        
    from source

)

select * from stg_product