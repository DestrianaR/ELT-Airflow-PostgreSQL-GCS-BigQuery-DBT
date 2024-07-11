
    
    

with dbt_test__target as (

  select addressid as unique_field
  from `elt-project-427017`.`sales_db_staging`.`stg_address`
  where addressid is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


