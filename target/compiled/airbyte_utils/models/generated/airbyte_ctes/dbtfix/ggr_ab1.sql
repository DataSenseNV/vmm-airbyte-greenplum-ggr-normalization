
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