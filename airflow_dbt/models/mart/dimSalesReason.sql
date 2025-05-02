select 
    {{ dbt_utils.generate_surrogate_key(['stg_salesreason.sales_reason_id']) }} as sales_reason_key,
    sales_reason_id,
    sales_reason,
    reason_type

from {{ ref('stg_salesreason') }}