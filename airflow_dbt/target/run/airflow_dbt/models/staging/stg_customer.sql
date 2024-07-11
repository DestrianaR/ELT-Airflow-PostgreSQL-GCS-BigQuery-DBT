

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_customer`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`customer`

),

renamed as (

    select
        customerid,
        personid,
        storeid,
        territoryid,
        accountnumber,
    from source

)

select * from renamed;

