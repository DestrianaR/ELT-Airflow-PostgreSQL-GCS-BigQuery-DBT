with source as (

    select * from {{ source('src_bigquery', 'countryregion') }}

),

renamed as (

    select
        countryregioncode,
        countryregionname

    from source

)

select * from renamed