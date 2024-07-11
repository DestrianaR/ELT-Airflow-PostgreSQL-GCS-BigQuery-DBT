
  
    

    create or replace table `elt-project-427017`.`sales_db_mart`.`dimTerritory`
      
    
    

    OPTIONS()
    as (
      select 
     to_hex(md5(cast(coalesce(cast(stg_salesterritory.territoryid as string), '_dbt_utils_surrogate_key_null_') as string))) as territory_key,
    territoryid, 
    salesterritoryname, 
    "Group" as territory_group, 
    countryregioncode, 
    costytd,  
    salesytd, 
    costlastyear,
    saleslastyear
from `elt-project-427017`.`sales_db_staging`.`stg_salesterritory`
    );
  