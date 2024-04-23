
-- Use the `ref` function to select from other models

select *
from {{ ref('my_first_dbt_model') }}
--union all
--select 3 as id - this is to test relationships
--where id = 1
