with source as (

    select * from {{ source('src_bigquery', 'person') }}

),

renamed as (

    select
        businessentityid,
        persontype,
        namestyle,
        title,
        firstname,
        middlename,
        lastname,
        suffix,
        emailpromotion,
        rowguid,
        birthdate,
        maritalstatus,
        gender,
        totalchildren,
        numberchildrenathome,
        houseownerflag,
        numbercarsowned,
        datefirstpurchase,
        commutedistance,
        education,
        occupation

    from source

)

select * from renamed