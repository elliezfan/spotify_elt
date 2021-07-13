
    
    



select count(*) as validation_errors
from "spotify600k"."dbt_spotify"."my_first_dbt_model"
where id is null


