
    
    

with all_values as (

    select
        productcategory as value_field,
        count(*) as n_records

    from `elt-project-427017`.`sales_db_staging`.`stg_productcategory`
    group by productcategory

)

select *
from all_values
where value_field not in (
    'Bikes','Components','Clothing','Accessories'
)


