select
    {{ dbt_utils.generate_surrogate_key(['stg_specialoffer.special_offer_id']) }} as special_offer_key,
    special_offer_id,
    description,
    sales_ytd,
    type,
    category,
    start_date,
    end_date,
    min_quantity,
    max_quantity
from {{ ref('stg_specialoffer') }}