{{
    config(
        materialized='incremental'
    )
}}
Select*,
EMP_ID ,
EMP_Name 
from "PRACTICE"."PUBLIC"."employee"

{% if is_incremental() %}

 where EMP_ID > (select max(EMP_ID) from {{ this }})

{% endif %}