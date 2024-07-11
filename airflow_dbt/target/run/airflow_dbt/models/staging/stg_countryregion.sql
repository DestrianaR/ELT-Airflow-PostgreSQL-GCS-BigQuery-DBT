

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_countryregion`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`countryregion`

),

renamed as (

    select
        countryregioncode,
        countryregionname

    from source

)

select * from renamed;

