

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_salesorderdetail`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`salesorderdetail`

),

renamed as (

    select
        salesorderid,
        salesorderdetailid,
        carriertrackingnumber,
        orderqty,
        productid,
        specialofferid,
        

  CAST(REPLACE(unitprice, ',', '.') AS FLOAT64)

 AS unitprice,
        

  CAST(REPLACE(unitpricediscount, ',', '.') AS FLOAT64)

 AS unitpricediscount,
        linetotal

    from source

)

select * from renamed;

