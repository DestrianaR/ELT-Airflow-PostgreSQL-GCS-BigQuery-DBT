with source as (

    select * from {{ source('src_bigquery', 'productsubcategory') }}

),

renamed as (

    select
        productsubcategoryid,
        productcategoryid,
        productsubcategory

    from source

)

select * from renamed