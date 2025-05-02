with source as (

    select * from {{ source('src_bigquery', 'productsubcategory') }}

),

stg_productsubcategory as (

    select
        productsubcategoryid AS product_subcategory_id,
        productcategoryid AS product_category_id,
        productsubcategory AS product_subcategory

    from source

)

select * from stg_productsubcategory