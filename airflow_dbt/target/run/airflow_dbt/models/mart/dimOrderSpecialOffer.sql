
  
    

    create or replace table `elt-project-427017`.`sales_db_mart`.`dimOrderSpecialOffer`
      
    
    

    OPTIONS()
    as (
      select
    to_hex(md5(cast(coalesce(cast(stg_specialoffer.specialofferid as string), '_dbt_utils_surrogate_key_null_') as string))) as special_offer_key,
    specialofferid,
    description,
    salesytd,
    type,
    category,
    startDate,
    enddate,
    minqty,
    maxqty
from `elt-project-427017`.`sales_db_staging`.`stg_specialoffer`
    );
  