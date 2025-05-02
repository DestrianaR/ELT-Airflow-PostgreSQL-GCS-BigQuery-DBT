{{ 
  config(
    materialized='table',
    partition_by={
      "field": "order_date",
      "data_type": "date"
    },
    cluster_by=["product_key", "customer_key", "territory_key"]
  ) 
}}

select
    {{ dbt_utils.generate_surrogate_key(['stg_salesorderdetail.sales_order_id','sales_order_detail_id']) }} as sales_key,
    {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_key,
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['special_offer_id']) }} as special_offer_key,
    {{ dbt_utils.generate_surrogate_key(['stg_salesorderheadersalesreason.sales_reason_id']) }} as sales_reason_key,
    {{ dbt_utils.generate_surrogate_key(['order_date']) }} as order_date_key,
    {{ dbt_utils.generate_surrogate_key(['ship_date']) }} as ship_date_key,
    {{ dbt_utils.generate_surrogate_key(['due_date']) }} as due_date_key,
    {{ dbt_utils.generate_surrogate_key(['territory_id']) }} as territory_key,
    order_date,
    online_order_flag,
    stg_salesorderdetail.special_offer_id as special_offer,
    stg_salesorderheadersalesreason.sales_reason_id as sales_reason,
    stg_salesorderdetail.unit_price_discount,
    stg_salesorderdetail.unit_price,
    stg_salesorderdetail.order_quantity,
    stg_salesorderdetail.line_total as sales_amount,
    case when stg_salesorderdetail.unit_price_discount > 0
        then stg_salesorderdetail.line_total * stg_salesorderdetail.unit_price_discount 
        else stg_salesorderdetail.line_total
        end as total_discount,
    stg_salesorderheader.tax_amt 
from {{ ref('stg_salesorderdetail') }}
inner join  {{ ref('stg_salesorderheader') }} on stg_salesorderdetail.sales_order_id = stg_salesorderheader.sales_order_id
left join {{ ref('stg_salesorderheadersalesreason') }} on stg_salesorderheader.sales_order_id = stg_salesorderheadersalesreason.sales_order_id
