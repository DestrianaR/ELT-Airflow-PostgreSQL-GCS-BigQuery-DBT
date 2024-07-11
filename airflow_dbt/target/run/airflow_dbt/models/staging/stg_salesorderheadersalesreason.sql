

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_salesorderheadersalesreason`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`salesorderheadersalesreason`

),

renamed as (

    select
        salesorderid,
        salesreasonid

    from source

)

select * from renamed;

