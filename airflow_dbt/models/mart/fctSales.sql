select
    {{ dbt_utils.generate_surrogate_key(['stg_salesorderdetail.salesorderid', 'salesorderdetailid']) }} as sales_key,
    {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_key,
    {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['specialofferid']) }} as special_offer_key,
    {{ dbt_utils.generate_surrogate_key(['stg_salesorderheadersalesreason.salesreasonid']) }} as sales_reason_key,
    {{ dbt_utils.generate_surrogate_key(['orderdate']) }} as order_date_key,
    {{ dbt_utils.generate_surrogate_key(['shipdate']) }} as ship_date_key,
    {{ dbt_utils.generate_surrogate_key(['duedate']) }} as due_date_key,
    {{ dbt_utils.generate_surrogate_key(['territoryid']) }} as territory_key,
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
from {{ ref('stg_salesorderdetail') }}
inner join  {{ ref('stg_salesorderheader') }} on stg_salesorderdetail.salesorderid = stg_salesorderheader.salesorderid
left join {{ ref('stg_salesorderheadersalesreason') }} on stg_salesorderheader.salesorderid = stg_salesorderheadersalesreason.salesorderid
