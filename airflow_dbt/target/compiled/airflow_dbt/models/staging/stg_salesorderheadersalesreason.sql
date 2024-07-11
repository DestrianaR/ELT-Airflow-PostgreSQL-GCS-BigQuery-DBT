with source as (

    select * from `elt-project-427017`.`sales_db`.`salesorderheadersalesreason`

),

renamed as (

    select
        salesorderid,
        salesreasonid

    from source

)

select * from renamed