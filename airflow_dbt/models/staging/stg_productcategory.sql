with source as (

    select * from {{ source('src_bigquery', 'productcategory') }}

),

renamed as (

    select
        productcategoryid,
        productcategory

    from source

)

select * from renamed