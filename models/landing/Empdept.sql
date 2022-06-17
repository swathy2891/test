{{
    config(
        materialized='incremental'
    )
}}
Select
EMP_ID ,
EMP_Name ,
Dept_No
from "LANDING"."SQLINC_PUBLIC"."Empdept"

{% if is_incremental() %}

 where salary > (select max(salary) from {{ this }})

{% endif %}