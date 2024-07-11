

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_businessentityaddress`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`businessentityaddress`

),
renamed as (

    select
        addresstypeid,
        businessentityid,
        addressid
    from source
)
    
select * from renamed;

