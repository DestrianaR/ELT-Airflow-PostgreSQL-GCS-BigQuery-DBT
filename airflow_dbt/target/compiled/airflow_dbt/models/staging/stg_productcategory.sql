with source as (

    select * from `elt-project-427017`.`sales_db`.`productcategory`

),

renamed as (

    select
        productcategoryid,
        productcategory

    from source

)

select * from renamed