with source as (

    select * from {{ source('src_bigquery', 'product') }}

),

renamed as (

    select
        productid,
        productname,
        productnumber,
        makeflag,
        finishedgoodsflag,
        color,
        safetystocklevel,
        reorderpoint,
        {{ convert_to_float('standardcost') }} AS standardcost,
        {{ convert_to_float('listprice') }} AS listprice,
        size,
        sizeunitmeasurecode,
        weightunitmeasurecode,
        weight,
        daystomanufacture,
        productline,
        class,
        style,
        productsubcategoryid,
        productmodelid,
        sellstartdate,
        sellenddate,
        discontinueddate
        
    from source

)

select * from renamed