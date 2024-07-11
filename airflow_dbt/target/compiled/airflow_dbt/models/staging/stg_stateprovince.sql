with source as (

    select * from `elt-project-427017`.`sales_db`.`stateprovince`

),

renamed as (

    select
        stateprovinceid,
        stateprovincecode,
        countryregioncode,
        isonlystateprovinceflag,
        statprovincename,
        territoryid

    from source

)

select * from renamed