

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_productsubcategory`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`productsubcategory`

),

renamed as (

    select
        productsubcategoryid,
        productcategoryid,
        productsubcategory

    from source

)

select * from renamed;

