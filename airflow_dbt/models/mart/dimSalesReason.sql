select 
     {{ dbt_utils.generate_surrogate_key(['stg_salesreason.salesreasonid']) }} as sales_reason_key,
    salesreasonid,
    salesreason,
    reasontype

from {{ ref('stg_salesreason') }}