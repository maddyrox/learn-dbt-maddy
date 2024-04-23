

{{ config(materialized='table') }}

with cte_sales_per_date
as
(
select  o_orderdate,
sum(o_totalprice) as sum_sales_per_date
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
group by o_orderdate
order by o_orderdate --limit 1000
)

select
o_orderdate,
sum_sales_per_date,
sum(sum_sales_per_date) over (order by o_orderdate asc) as cumulative_sales_per_record
from cte_sales_per_date
order by o_orderdate asc
