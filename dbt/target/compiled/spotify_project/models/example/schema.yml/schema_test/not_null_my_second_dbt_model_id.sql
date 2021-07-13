
    
    



select count(*) as validation_errors
from "spotify600k"."dbt_spotify"."my_second_dbt_model"
where id is null


