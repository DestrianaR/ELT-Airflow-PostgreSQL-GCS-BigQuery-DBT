with source as (

    select * from `elt-project-427017`.`sales_db`.`productsubcategory`

),

renamed as (

    select
        productsubcategoryid,
        productcategoryid,
        productsubcategory

    from source

)

select * from renamed