with source as (

    select * from `elt-project-427017`.`sales_db`.`salesterritory`

),

renamed as (

    select
        territoryid,
        salesterritoryname,
        countryregioncode,
        `group`,
        

  CAST(REPLACE(salesytd, ',', '.') AS FLOAT64)

 AS salesytd,
        

  CAST(REPLACE(saleslastyear, ',', '.') AS FLOAT64)

 AS saleslastyear,
        

  CAST(REPLACE(costytd, ',', '.') AS FLOAT64)

 AS costytd,
        

  CAST(REPLACE(costlastyear, ',', '.') AS FLOAT64)

 AS costlastyear,
        

    from source

)

select * from renamed