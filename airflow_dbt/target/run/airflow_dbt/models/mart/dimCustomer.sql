
  
    

    create or replace table `elt-project-427017`.`sales_db_mart`.`dimCustomer`
      
    
    

    OPTIONS()
    as (
      select
    to_hex(md5(cast(coalesce(cast(stg_customer.customerid as string), '_dbt_utils_surrogate_key_null_') as string))) as customer_key,
    stg_customer.customerid,
    stg_person.businessentityid as personbusinessentityid,
    stg_person.title,
    stg_person.firstname || ' '|| lastname as fullname,
    stg_person.houseownerflag, 
    stg_person.occupation, 
    stg_person.maritalstatus, 
    stg_person.commutedistance, 
    stg_person.education, 
    stg_person.gender,
    stg_person.numbercarsowned, 
    stg_person.totalchildren, 
    stg_person.birthdate, 
    stg_person.datefirstpurchase,
    stg_countryregion.countryregionname as country,
    stg_address.city,
    stg_stateprovince.statprovincename as state,
    stg_address.postalcode,
    stg_address.addressline1,
    stg_address.addressline2
from `elt-project-427017`.`sales_db_staging`.`stg_customer`
left join `elt-project-427017`.`sales_db_staging`.`stg_person` on stg_customer.personid = stg_person.businessentityid
left join `elt-project-427017`.`sales_db_staging`.`stg_businessentityaddress` on stg_businessentityaddress.businessentityid = stg_person.businessentityid
left join `elt-project-427017`.`sales_db_staging`.`stg_address` on stg_address.addressid = stg_businessentityaddress.addressid
left join `elt-project-427017`.`sales_db_staging`.`stg_stateprovince` on stg_stateprovince.stateprovinceid = stg_address.stateprovinceid
left join `elt-project-427017`.`sales_db_staging`.`stg_countryregion` on stg_countryregion.countryregioncode = stg_stateprovince.countryregioncode
where persontype = 'IN'
and addresstypeid = 2
    );
  