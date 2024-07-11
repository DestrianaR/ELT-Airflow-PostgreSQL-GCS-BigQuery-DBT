select
    {{ dbt_utils.generate_surrogate_key(['stg_specialoffer.specialofferid']) }} as special_offer_key,
    specialofferid,
    description,
    salesytd,
    type,
    category,
    startDate,
    enddate,
    minqty,
    maxqty
from {{ ref('stg_specialoffer') }}