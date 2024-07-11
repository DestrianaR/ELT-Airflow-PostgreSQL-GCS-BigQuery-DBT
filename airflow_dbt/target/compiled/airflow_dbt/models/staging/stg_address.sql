with source as (

    select * from `elt-project-427017`.`sales_db`.`address`

),

renamed as (

    select
        addressid,
        addressline1,
        addressline2,
        city,
        stateprovinceid,
        postalcode,
        spatiallocation

    from source

)

select * from renamed