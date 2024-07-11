
    
    

with child as (
    select stateprovinceid as from_field
    from `elt-project-427017`.`sales_db_staging`.`stg_address`
    where stateprovinceid is not null
),

parent as (
    select stateprovinceid as to_field
    from `elt-project-427017`.`sales_db_staging`.`stg_stateprovince`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


