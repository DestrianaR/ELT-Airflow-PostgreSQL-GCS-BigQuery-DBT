with source as (

    select * from `elt-project-427017`.`sales_db`.`businessentityaddress`

),
renamed as (

    select
        addresstypeid,
        businessentityid,
        addressid
    from source
)
    
select * from renamed