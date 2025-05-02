select 
    {{ dbt_utils.generate_surrogate_key(['stg_salesterritory.territory_id']) }} as territory_key,
    territory_id, 
    sales_territory_name, 
    territory_group,
    country_region_code, 
    cost_ytd,  
    sales_ytd, 
    cost_last_year,
    sales_last_year
from {{ ref('stg_salesterritory') }}