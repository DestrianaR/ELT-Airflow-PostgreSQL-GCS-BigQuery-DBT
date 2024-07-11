with source as (

    select * from `elt-project-427017`.`sales_db`.`salesorderheader`

),

renamed as (

    select
        salesorderid,
        revisionnumber,
        TIMESTAMP(orderdate) AS orderdate,
        TIMESTAMP(duedate) AS duedate,
        TIMESTAMP(shipdate) AS shipdate,
        status,
        onlineorderflag,
        salesordernumber,
        purchaseordernumber,
        accountnumber,
        customerid,
        salespersonid,
        territoryid,
        billtoaddressid,
        shiptoaddressid,
        shipmethodid,
        creditcardid,
        creditcardapprovalcode,
        currencyrateid,
        

  CAST(REPLACE(subtotal, ',', '.') AS FLOAT64)

 AS subtotal,
        

  CAST(REPLACE(taxamt, ',', '.') AS FLOAT64)

 AS taxamt,
        

  CAST(REPLACE(freight, ',', '.') AS FLOAT64)

 AS freight,
        

  CAST(REPLACE(totaldue, ',', '.') AS FLOAT64)

 AS totaldue,
        comment

    from source

)

select * from renamed