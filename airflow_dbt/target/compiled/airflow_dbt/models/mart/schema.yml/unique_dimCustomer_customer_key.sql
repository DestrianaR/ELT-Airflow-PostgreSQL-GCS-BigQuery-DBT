
    
    

with dbt_test__target as (

  select customer_key as unique_field
  from `elt-project-427017`.`sales_db_mart`.`dimCustomer`
  where customer_key is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


