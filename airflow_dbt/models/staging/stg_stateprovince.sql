with source as (

    select * from {{ source('src_bigquery', 'stateprovince') }}

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