with source as (

    select * from `elt-project-427017`.`sales_db`.`salesreason`

),

renamed as (

    select
        salesreasonid,
        salesreason,
        reasontype

    from source

)

select * from renamed