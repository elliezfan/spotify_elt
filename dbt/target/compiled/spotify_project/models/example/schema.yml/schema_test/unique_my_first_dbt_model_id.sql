
    
    



select count(*) as validation_errors
from (

    select
        id

    from "spotify600k"."dbt_spotify"."my_first_dbt_model"
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


