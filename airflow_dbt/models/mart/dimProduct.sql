select
    {{ dbt_utils.generate_surrogate_key(['stg_product.product_id']) }} as product_key,
    stg_product.product_id,
    stg_product.product_name,
    stg_product.product_number,
    stg_product.color,
    stg_product.days_to_manufacture,
	stg_product.safety_stock_level,
    stg_product.standard_cost,
    stg_productsubcategory.product_subcategory as product_subcategory_name,
    stg_productcategory.product_category as product_category_name,
    stg_product.sell_start_date,
    stg_product.sell_end_date
from  {{ ref('stg_product') }}
left join  {{ ref('stg_productsubcategory') }} on stg_product.product_subcategory_id = stg_productsubcategory.product_subcategory_id
left join  {{ ref('stg_productcategory') }} on stg_productsubcategory.product_category_id = stg_productcategory.product_category_id