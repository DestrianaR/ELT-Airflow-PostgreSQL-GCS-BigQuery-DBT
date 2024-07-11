select
    to_hex(md5(cast(coalesce(cast(stg_salesorderdetail.salesorderid as string), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(salesorderdetailid as string), '_dbt_utils_surrogate_key_null_') as string))) as sales_key,
    to_hex(md5(cast(coalesce(cast(productid as string), '_dbt_utils_surrogate_key_null_') as string))) as product_key,
    to_hex(md5(cast(coalesce(cast(customerid as string), '_dbt_utils_surrogate_key_null_') as string))) as customer_key,
    to_hex(md5(cast(coalesce(cast(specialofferid as string), '_dbt_utils_surrogate_key_null_') as string))) as special_offer_key,
    to_hex(md5(cast(coalesce(cast(stg_salesorderheadersalesreason.salesreasonid as string), '_dbt_utils_surrogate_key_null_') as string))) as sales_reason_key,
    to_hex(md5(cast(coalesce(cast(orderdate as string), '_dbt_utils_surrogate_key_null_') as string))) as order_date_key,
    to_hex(md5(cast(coalesce(cast(shipdate as string), '_dbt_utils_surrogate_key_null_') as string))) as ship_date_key,
    to_hex(md5(cast(coalesce(cast(duedate as string), '_dbt_utils_surrogate_key_null_') as string))) as due_date_key,
    to_hex(md5(cast(coalesce(cast(territoryid as string), '_dbt_utils_surrogate_key_null_') as string))) as territory_key,
    orderdate,
    onlineorderflag,
    stg_salesorderdetail.specialofferid as specialoffer,
    stg_salesorderheadersalesreason.salesreasonid as salesreason,
    stg_salesorderdetail.unitpricediscount as unitpricediscount,
    stg_salesorderdetail.unitprice,
    stg_salesorderdetail.orderqty,
    stg_salesorderdetail.linetotal as salesamount,
    case when stg_salesorderdetail.unitpricediscount > 0
        then stg_salesorderdetail.linetotal * stg_salesorderdetail.unitpricediscount 
        else stg_salesorderdetail.linetotal
        end as totaldiscount,
    stg_salesorderheader.taxamt 
from `elt-project-427017`.`sales_db_staging`.`stg_salesorderdetail`
inner join  `elt-project-427017`.`sales_db_staging`.`stg_salesorderheader` on stg_salesorderdetail.salesorderid = stg_salesorderheader.salesorderid
left join `elt-project-427017`.`sales_db_staging`.`stg_salesorderheadersalesreason` on stg_salesorderheader.salesorderid = stg_salesorderheadersalesreason.salesorderid