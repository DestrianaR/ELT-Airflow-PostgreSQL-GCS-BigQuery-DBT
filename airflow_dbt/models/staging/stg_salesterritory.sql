with source as (

    select * from {{ source('src_bigquery', 'salesterritory') }}

),

renamed as (

    select
        territoryid,
        salesterritoryname,
        countryregioncode,
        `group`,
        {{ convert_to_float('salesytd') }} AS salesytd,
        {{ convert_to_float('saleslastyear') }} AS saleslastyear,
        {{ convert_to_float('costytd') }} AS costytd,
        {{ convert_to_float('costlastyear') }} AS costlastyear,
        

    from source

)

select * from renamed