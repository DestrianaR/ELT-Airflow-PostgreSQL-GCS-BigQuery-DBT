-- CTE to create a date dimension from the stg_date table
with date_dimension as (
    select * from `elt-project-427017`.`sales_db_staging`.`stg_date`
),

-- CTE to generate a full date range from start_date to end_date using dbt_date.get_base_dates macro
full_dt as (
    
    with date_spine as
(

    





with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
     + 
    
    p5.generated_number * power(2, 5)
     + 
    
    p6.generated_number * power(2, 6)
     + 
    
    p7.generated_number * power(2, 7)
     + 
    
    p8.generated_number * power(2, 8)
     + 
    
    p9.generated_number * power(2, 9)
     + 
    
    p10.generated_number * power(2, 10)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
     cross join 
    
    p as p7
     cross join 
    
    p as p8
     cross join 
    
    p as p9
     cross join 
    
    p as p10
    
    

    )

    select *
    from unioned
    where generated_number <= 1460
    order by generated_number



),

all_periods as (

    select (
        

        datetime_add(
            cast( cast('2011-01-01' as datetime ) as datetime),
        interval (row_number() over (order by 1) - 1) day
        )


    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= cast('2014-12-31' as datetime )

)

select * from filtered



)
select
    cast(d.date_day as timestamp) as date_day
from
    date_spine d


),

-- CTE to join the date dimension with the full date range and perform various timezone conversions
full_dt_tr as (
select
    d.*,
    f.date_day as fulldt,
    timestamp(datetime(f.date_day, 'America/New_York')) as dulldtz,
    timestamp(datetime(f.date_day, 'America/New_York')) as dulldtzt,
    timestamp(datetime(f.date_day, 'America/New_York')) as test,
    --f.date_day  AT TIME ZONE 'PST' AS "direct_pst",
    TIMESTAMP(f.date_day) AS direct_dts,
    TIMESTAMP(f.date_day) AS ts_utc
from
    date_dimension d
    left join full_dt f on d.date_day = cast(f.date_day as date)
)

-- Final select statement to generate the date_key and select all columns from full_dt_tr
select 
    to_hex(md5(cast(coalesce(cast(direct_dts as string), '_dbt_utils_surrogate_key_null_') as string))) as date_key,
    *
From full_dt_tr