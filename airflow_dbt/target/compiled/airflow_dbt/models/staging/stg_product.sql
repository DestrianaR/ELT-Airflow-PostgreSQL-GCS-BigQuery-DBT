with source as (

    select * from `elt-project-427017`.`sales_db`.`product`

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
        

  CAST(REPLACE(standardcost, ',', '.') AS FLOAT64)

 AS standardcost,
        

  CAST(REPLACE(listprice, ',', '.') AS FLOAT64)

 AS listprice,
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