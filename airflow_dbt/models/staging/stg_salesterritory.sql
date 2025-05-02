with source as (

    select * from {{ source('src_bigquery', 'salesterritory') }}

),

stg_salesterritory as (

    select
        territoryid AS territory_id,
        salesterritoryname AS sales_territory_name,
        countryregioncode AS country_region_code,
        `group` AS territory_group,
        {{ convert_to_float('salesytd') }} AS sales_ytd,
        {{ convert_to_float('saleslastyear') }} AS sales_last_year,
        {{ convert_to_float('costytd') }} AS cost_ytd,
        {{ convert_to_float('costlastyear') }} AS cost_last_year

        

    from source

)

select * from stg_salesterritory