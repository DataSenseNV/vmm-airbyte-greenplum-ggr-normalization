

  create  table "cdc_testing".dbtfix."ggr__dbt_tmp"
  as (
    
with __dbt__cte__ggr_ab1 as (

-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: "cdc_testing".dbtfix._airbyte_raw_ggr
select
    jsonb_extract_path_text(_airbyte_data, 'gid') as gid,
    jsonb_extract_path_text(_airbyte_data, 'geom') as geom,
    jsonb_extract_path_text(_airbyte_data, 'naam') as naam,
    jsonb_extract_path_text(_airbyte_data, 'oidn') as oidn,
    jsonb_extract_path_text(_airbyte_data, 'uidn') as uidn,
    jsonb_extract_path_text(_airbyte_data, 'numac') as numac,
    jsonb_extract_path_text(_airbyte_data, 'ggrnaa') as ggrnaa,
    jsonb_extract_path_text(_airbyte_data, 'terrid') as terrid,
    jsonb_extract_path_text(_airbyte_data, 'niscode') as niscode,
    jsonb_extract_path_text(_airbyte_data, 'objectid') as objectid,
    jsonb_extract_path_text(_airbyte_data, 'datpublbs') as datpublbs,
    jsonb_extract_path_text(_airbyte_data, 'versdatum') as versdatum,
    jsonb_extract_path_text(_airbyte_data, 'shape_area') as shape_area,
    jsonb_extract_path_text(_airbyte_data, 'shape_leng') as shape_leng,
    jsonb_extract_path_text(_airbyte_data, '_ab_cdc_lsn') as _ab_cdc_lsn,
    jsonb_extract_path_text(_airbyte_data, '_ab_cdc_deleted_at') as _ab_cdc_deleted_at,
    jsonb_extract_path_text(_airbyte_data, '_ab_cdc_updated_at') as _ab_cdc_updated_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at
from "cdc_testing".dbtfix._airbyte_raw_ggr as table_alias
-- ggr
where 1 = 1
),  __dbt__cte__ggr_ab2 as (

-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: __dbt__cte__ggr_ab1
select
    cast(gid as 
    float
) as gid,
    cast(geom as 
    varchar
) as geom,
    cast(naam as 
    varchar
) as naam,
    cast(oidn as 
    float
) as oidn,
    cast(uidn as 
    float
) as uidn,
    cast(numac as 
    varchar
) as numac,
    cast(ggrnaa as 
    varchar
) as ggrnaa,
    cast(terrid as 
    float
) as terrid,
    cast(niscode as 
    float
) as niscode,
    cast(objectid as 
    float
) as objectid,
    cast(datpublbs as 
    varchar
) as datpublbs,
    cast(versdatum as 
    varchar
) as versdatum,
    cast(shape_area as 
    float
) as shape_area,
    cast(shape_leng as 
    float
) as shape_leng,
    cast(_ab_cdc_lsn as 
    float
) as _ab_cdc_lsn,
    cast(_ab_cdc_deleted_at as 
    varchar
) as _ab_cdc_deleted_at,
    cast(_ab_cdc_updated_at as 
    varchar
) as _ab_cdc_updated_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at
from __dbt__cte__ggr_ab1
-- ggr
where 1 = 1
),  __dbt__cte__ggr_ab3 as (

-- SQL model to build a hash column based on the values of this record
-- depends_on: __dbt__cte__ggr_ab2
select
    md5(cast(coalesce(cast(gid as 
    varchar
), '') || '-' || coalesce(cast(geom as 
    varchar
), '') || '-' || coalesce(cast(naam as 
    varchar
), '') || '-' || coalesce(cast(oidn as 
    varchar
), '') || '-' || coalesce(cast(uidn as 
    varchar
), '') || '-' || coalesce(cast(numac as 
    varchar
), '') || '-' || coalesce(cast(ggrnaa as 
    varchar
), '') || '-' || coalesce(cast(terrid as 
    varchar
), '') || '-' || coalesce(cast(niscode as 
    varchar
), '') || '-' || coalesce(cast(objectid as 
    varchar
), '') || '-' || coalesce(cast(datpublbs as 
    varchar
), '') || '-' || coalesce(cast(versdatum as 
    varchar
), '') || '-' || coalesce(cast(shape_area as 
    varchar
), '') || '-' || coalesce(cast(shape_leng as 
    varchar
), '') || '-' || coalesce(cast(_ab_cdc_lsn as 
    varchar
), '') || '-' || coalesce(cast(_ab_cdc_deleted_at as 
    varchar
), '') || '-' || coalesce(cast(_ab_cdc_updated_at as 
    varchar
), '') as 
    varchar
)) as _airbyte_ggr_hashid,
    tmp.*
from __dbt__cte__ggr_ab2 tmp
-- ggr
where 1 = 1
)-- Final base SQL model
-- depends_on: __dbt__cte__ggr_ab3
select
    gid,
    geom,
    naam,
    oidn,
    uidn,
    numac,
    ggrnaa,
    terrid,
    niscode,
    objectid,
    datpublbs,
    versdatum,
    shape_area,
    shape_leng,
    _ab_cdc_lsn,
    _ab_cdc_deleted_at,
    _ab_cdc_updated_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at,
    _airbyte_ggr_hashid
from __dbt__cte__ggr_ab3
-- ggr from "cdc_testing".dbtfix._airbyte_raw_ggr
where 1 = 1
  );