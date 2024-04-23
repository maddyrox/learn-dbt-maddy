
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

select
cust.c_custkey,
cust.c_name,
cust.c_nationkey,
sum(ord.o_totalprice) as total_purchase_amount
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER cust
left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS ord
on ord.o_custkey = cust.c_custkey
group by
c_custkey,
c_name,
c_nationkey


)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
