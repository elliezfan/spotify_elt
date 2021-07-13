-- Use the `ref` function to select from other models

select *
from "spotify600k"."dbt_spotify"."my_first_dbt_model"
where id = 1