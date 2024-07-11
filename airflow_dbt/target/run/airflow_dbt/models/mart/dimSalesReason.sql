
  
    

    create or replace table `elt-project-427017`.`sales_db_mart`.`dimSalesReason`
      
    
    

    OPTIONS()
    as (
      select 
     to_hex(md5(cast(coalesce(cast(stg_salesreason.salesreasonid as string), '_dbt_utils_surrogate_key_null_') as string))) as sales_reason_key,
    salesreasonid,
    salesreason,
    reasontype

from `elt-project-427017`.`sales_db_staging`.`stg_salesreason`
    );
  