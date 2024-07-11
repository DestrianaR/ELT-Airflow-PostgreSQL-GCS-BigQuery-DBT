select
    to_hex(md5(cast(coalesce(cast(stg_product.productid as string), '_dbt_utils_surrogate_key_null_') as string))) as product_key,
    stg_product.productid,
    stg_product.productname as product_name,
    stg_product.productnumber,
    stg_product.color,
    stg_product.daystomanufacture,
	stg_product.safetystocklevel,
    stg_product.standardcost,
    stg_productsubcategory.productsubcategory as product_subcategory_name,
    stg_productcategory.productcategory as product_category_name,
    stg_product.sellstartdate,
    stg_product.sellenddate
from  `elt-project-427017`.`sales_db_staging`.`stg_product`
left join  `elt-project-427017`.`sales_db_staging`.`stg_productsubcategory` on stg_product.productsubcategoryid = stg_productsubcategory.productsubcategoryid
left join  `elt-project-427017`.`sales_db_staging`.`stg_productcategory` on stg_productsubcategory.productcategoryid = stg_productcategory.productcategoryid