with source as (

    select * from {{ source('src_bigquery', 'countryregion') }}

),

stg_countryregion as (

    select
        countryregioncode AS country_region_code,
        countryregionname AS country_region_name

    from source

)

select * from stg_countryregion