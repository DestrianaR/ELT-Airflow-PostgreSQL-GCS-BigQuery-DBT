with source as (

    select * from {{ source('src_bigquery', 'productcategory') }}

),

stg_productcategory as (

    select
        productcategoryid AS product_category_id,
        productcategory AS product_category

    from source

)

select * from stg_productcategory