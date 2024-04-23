
{{ config(materialized ='table',alias='playing_with_tests') }}

select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
