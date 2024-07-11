-- CTE to create a date dimension from the stg_date table
with date_dimension as (
    select * from {{ ref('stg_date') }}
),

-- CTE to generate a full date range from start_date to end_date using dbt_date.get_base_dates macro
full_dt as (
    {{ dbt_date.get_base_dates(start_date="2011-01-01", end_date="2014-12-31") }}
),

-- CTE to join the date dimension with the full date range and perform various timezone conversions
full_dt_tr as (
select
    d.*,
    f.date_day as fulldt,
    {{ dbt_date.convert_timezone("f.date_day", "America/New_York", "UTC") }} as dulldtz,
    {{ dbt_date.convert_timezone("f.date_day", "America/New_York", source_tz="UTC") }} as dulldtzt,
    {{ dbt_date.convert_timezone("f.date_day", "America/New_York") }} as test,
    --f.date_day  AT TIME ZONE 'PST' AS "direct_pst",
    TIMESTAMP(f.date_day) AS direct_dts,
    TIMESTAMP(f.date_day) AS ts_utc
from
    date_dimension d
    left join full_dt f on d.date_day = cast(f.date_day as date)
)

-- Final select statement to generate the date_key and select all columns from full_dt_tr
select 
    {{ dbt_utils.generate_surrogate_key(['direct_dts']) }} as date_key,
    *
From full_dt_tr