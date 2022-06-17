{{ config(materialized='incremental', unique_key='SK_EMP_ID') }}

Select
{{ dbt_utils.surrogate_key(
      'EMP_ID'
  ) }} as SK_EMP_ID,
EMP_ID ,
EMP_Name ,
salary 
from "LANDING"."SQLINC_PUBLIC"."EMPLOYEE"

{% if is_incremental() %}

 where SK_EMP_ID > (select max(SK_EMP_ID) from {{ this }})

{% endif %}