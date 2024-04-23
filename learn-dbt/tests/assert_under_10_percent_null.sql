--custom test customer query
-- check the occurence of ids as 1 and apply test on it 
-- this is dbt_project.yml custom tests and not schema.yml test cases
-- if the test query returns 1 result then it will fail tests

select sum(case when id =1 then 1 else 0 end)/count(*) as total_nulls
from {{ ref('my_first_dbt_model') }}
having sum(case when id = 1 then 1 else 0 end)/count(*) > .4
