with source as (

    select * from `elt-project-427017`.`sales_db`.`countryregion`

),

renamed as (

    select
        countryregioncode,
        countryregionname

    from source

)

select * from renamed