select
    {{ dbt_utils.generate_surrogate_key(['stg_customer.customer_id']) }} as customer_key,
    stg_customer.customer_id,
    stg_person.business_entity_id as person_business_entity_id,
    stg_person.title,
    stg_person.first_name || ' '|| last_name as fullname,
    stg_person.house_owner_flag, 
    stg_person.occupation, 
    stg_person.marital_status, 
    stg_person.commute_distance, 
    stg_person.education, 
    stg_person.gender,
    stg_person.number_cars_owned, 
    stg_person.total_children, 
    stg_person.birth_date, 
    stg_person.date_first_purchase,
    stg_countryregion.country_region_name as country,
    stg_address.city,
    stg_stateprovince.state_province_name as state,
    stg_address.postal_code,
    stg_address.address_line1,
    stg_address.address_line2
from {{ ref('stg_customer') }}
left join {{ ref('stg_person') }} on stg_customer.person_id = stg_person.business_entity_id
left join {{ ref('stg_businessentityaddress') }} on stg_businessentityaddress.business_entity_id = stg_person.business_entity_id
left join {{ ref('stg_address') }} on stg_address.address_id = stg_businessentityaddress.address_id
left join {{ ref('stg_stateprovince') }} on stg_stateprovince.state_province_id = stg_address.state_province_id
left join {{ ref('stg_countryregion') }} on stg_countryregion.country_region_code = stg_stateprovince.country_region_code
where person_type = 'IN'
and address_type_id = 2