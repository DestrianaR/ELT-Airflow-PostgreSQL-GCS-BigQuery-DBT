with source as (

    select * from `elt-project-427017`.`sales_db`.`store`

),

renamed as (

    select
        businessentityid,
        storename,
        salespersonid,
        demographics

    from source

)

select * from renamed