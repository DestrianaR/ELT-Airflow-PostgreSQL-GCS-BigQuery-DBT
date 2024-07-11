with source as (

    select * from `elt-project-427017`.`sales_db`.`customer`

),

renamed as (

    select
        customerid,
        personid,
        storeid,
        territoryid,
        accountnumber,
    from source

)

select * from renamed