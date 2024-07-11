

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_store`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`store`

),

renamed as (

    select
        businessentityid,
        storename,
        salespersonid,
        demographics

    from source

)

select * from renamed;

