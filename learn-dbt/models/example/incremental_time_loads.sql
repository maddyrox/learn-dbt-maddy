{{ config(materialized='incremental',unique_key = 't_time') }}

select * from
SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.time_DIM
where to_time(concat(t_hour::varchar,':',t_minute,':',t_second)) <= current_time

{% if is_incremental() %}
  and to_time(concat(t_hour::varchar,':',t_minute,':',t_second)) > (select max(to_time(concat(t_hour::varchar,':',t_minute,':',t_second)))  from {{ this }})
{% endif %}
