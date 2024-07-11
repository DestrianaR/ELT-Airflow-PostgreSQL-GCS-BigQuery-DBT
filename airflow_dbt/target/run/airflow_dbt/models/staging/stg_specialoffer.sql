

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_specialoffer`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`specialoffer`

),

renamed as (

    select
        specialofferid,
        description,
        

  CAST(REPLACE(discountpct, ',', '.') AS FLOAT64)

 AS salesytd,
        type,
        category,
        startdate,
        enddate,
        minqty,
        maxqty
    from source

)

select * from renamed;

