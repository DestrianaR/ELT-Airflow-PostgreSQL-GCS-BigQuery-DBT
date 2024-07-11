

  create or replace view `elt-project-427017`.`sales_db_staging`.`stg_person`
  OPTIONS()
  as with source as (

    select * from `elt-project-427017`.`sales_db`.`person`

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

select * from renamed;

