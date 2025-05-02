with source as (

    select * from {{ source('src_bigquery', 'stateprovince') }}

),

stg_stateprovince as (

    select
        stateprovinceid AS state_province_id,
        stateprovincecode AS state_province_code,
        countryregioncode AS country_region_code,
        isonlystateprovinceflag AS is_only_state_province_flag,
        statprovincename AS state_province_name,
        territoryid AS territory_id

    from source

)

select * from stg_stateprovince