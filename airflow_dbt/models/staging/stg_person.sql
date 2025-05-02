with source as (

    select * from {{ source('src_bigquery', 'person') }}

),

stg_person as (

    select
        businessentityid AS business_entity_id,
        persontype AS person_type,
        namestyle AS name_style,
        title,
        firstname AS first_name,
        middlename AS middle_name,
        lastname AS last_name,
        suffix,
        emailpromotion AS email_promotion,
        rowguid,
        birthdate AS birth_date,
        maritalstatus AS marital_status,
        gender,
        totalchildren AS total_children,
        numberchildrenathome AS number_children_at_home,
        houseownerflag AS house_owner_flag,
        numbercarsowned AS number_cars_owned,
        datefirstpurchase AS date_first_purchase,
        commutedistance AS commute_distance,
        education,
        occupation

    from source

)

select * from stg_person