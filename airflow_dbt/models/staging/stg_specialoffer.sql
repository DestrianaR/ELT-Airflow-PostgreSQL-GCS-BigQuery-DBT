with source as (

    select * from {{ source('src_bigquery', 'specialoffer') }}

),

stg_specialoffer as (

    select
        specialofferid AS special_offer_id,
        description,
        {{ convert_to_float('discountpct') }} AS sales_ytd,
        type,
        category,
        startdate AS start_date,
        enddate AS end_date,
        minqty AS min_quantity,
        maxqty AS max_quantity
    from source

)

select * from stg_specialoffer

