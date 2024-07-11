with source as (

    select * from {{ source('src_bigquery', 'specialoffer') }}

),

renamed as (

    select
        specialofferid,
        description,
        {{ convert_to_float('discountpct') }} AS salesytd,
        type,
        category,
        startdate,
        enddate,
        minqty,
        maxqty
    from source

)

select * from renamed

