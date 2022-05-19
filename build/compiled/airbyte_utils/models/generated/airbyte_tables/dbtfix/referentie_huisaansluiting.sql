
with __dbt__cte__referentie_huisaansluiting_ab1 as (

-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: "cdc_testing".dbtfix._airbyte_raw_referentie_huisaansluiting
select
    jsonb_extract_path_text(_airbyte_data, 'ie') as ie,
    jsonb_extract_path_text(_airbyte_data, 'st_x') as st_x,
    jsonb_extract_path_text(_airbyte_data, 'st_y') as st_y,
    jsonb_extract_path_text(_airbyte_data, 'appnr') as appnr,
    jsonb_extract_path_text(_airbyte_data, 'busnr') as busnr,
    jsonb_extract_path_text(_airbyte_data, 'actief') as actief,
    jsonb_extract_path_text(_airbyte_data, 'huisnr') as huisnr,
    jsonb_extract_path_text(_airbyte_data, 'str_id') as str_id,
    jsonb_extract_path_text(_airbyte_data, 'huisa_id') as huisa_id,
    jsonb_extract_path_text(_airbyte_data, 'gebruiker') as gebruiker,
    jsonb_extract_path_text(_airbyte_data, 'geometrie') as geometrie,
    jsonb_extract_path_text(_airbyte_data, '_ab_cdc_lsn') as _ab_cdc_lsn,
    jsonb_extract_path_text(_airbyte_data, 'proj_id_ibe') as proj_id_ibe,
    jsonb_extract_path_text(_airbyte_data, 'dat_wijziging') as dat_wijziging,
    jsonb_extract_path_text(_airbyte_data, 'proj_id_aansl') as proj_id_aansl,
    jsonb_extract_path_text(_airbyte_data, '_ab_cdc_deleted_at') as _ab_cdc_deleted_at,
    jsonb_extract_path_text(_airbyte_data, '_ab_cdc_updated_at') as _ab_cdc_updated_at,
    jsonb_extract_path_text(_airbyte_data, 'iba_plaatsingsdatum') as iba_plaatsingsdatum,
    jsonb_extract_path_text(_airbyte_data, 'iba_zekerheid_plaatsingsdatum') as iba_zekerheid_plaatsingsdatum,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at
from "cdc_testing".dbtfix._airbyte_raw_referentie_huisaansluiting as table_alias
-- referentie_huisaansluiting
where 1 = 1
),  __dbt__cte__referentie_huisaansluiting_ab2 as (

-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: __dbt__cte__referentie_huisaansluiting_ab1
select
    cast(ie as 
    float
) as ie,
    cast(st_x as 
    float
) as st_x,
    cast(st_y as 
    float
) as st_y,
    cast(appnr as 
    varchar
) as appnr,
    cast(busnr as 
    varchar
) as busnr,
    cast(actief as boolean) as actief,
    cast(huisnr as 
    varchar
) as huisnr,
    cast(str_id as 
    float
) as str_id,
    cast(huisa_id as 
    float
) as huisa_id,
    cast(gebruiker as 
    varchar
) as gebruiker,
    cast(geometrie as 
    varchar
) as geometrie,
    cast(_ab_cdc_lsn as 
    float
) as _ab_cdc_lsn,
    cast(proj_id_ibe as 
    float
) as proj_id_ibe,
    cast(dat_wijziging as 
    varchar
) as dat_wijziging,
    cast(proj_id_aansl as 
    float
) as proj_id_aansl,
    cast(_ab_cdc_deleted_at as 
    varchar
) as _ab_cdc_deleted_at,
    cast(_ab_cdc_updated_at as 
    varchar
) as _ab_cdc_updated_at,
    cast(iba_plaatsingsdatum as 
    varchar
) as iba_plaatsingsdatum,
    cast(iba_zekerheid_plaatsingsdatum as 
    varchar
) as iba_zekerheid_plaatsingsdatum,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at
from __dbt__cte__referentie_huisaansluiting_ab1
-- referentie_huisaansluiting
where 1 = 1
),  __dbt__cte__referentie_huisaansluiting_ab3 as (

-- SQL model to build a hash column based on the values of this record
-- depends_on: __dbt__cte__referentie_huisaansluiting_ab2
select
    md5(cast(coalesce(cast(ie as 
    varchar
), '') || '-' || coalesce(cast(st_x as 
    varchar
), '') || '-' || coalesce(cast(st_y as 
    varchar
), '') || '-' || coalesce(cast(appnr as 
    varchar
), '') || '-' || coalesce(cast(busnr as 
    varchar
), '') || '-' || coalesce(cast(actief as 
    varchar
), '') || '-' || coalesce(cast(huisnr as 
    varchar
), '') || '-' || coalesce(cast(str_id as 
    varchar
), '') || '-' || coalesce(cast(huisa_id as 
    varchar
), '') || '-' || coalesce(cast(gebruiker as 
    varchar
), '') || '-' || coalesce(cast(geometrie as 
    varchar
), '') || '-' || coalesce(cast(_ab_cdc_lsn as 
    varchar
), '') || '-' || coalesce(cast(proj_id_ibe as 
    varchar
), '') || '-' || coalesce(cast(dat_wijziging as 
    varchar
), '') || '-' || coalesce(cast(proj_id_aansl as 
    varchar
), '') || '-' || coalesce(cast(_ab_cdc_deleted_at as 
    varchar
), '') || '-' || coalesce(cast(_ab_cdc_updated_at as 
    varchar
), '') || '-' || coalesce(cast(iba_plaatsingsdatum as 
    varchar
), '') || '-' || coalesce(cast(iba_zekerheid_plaatsingsdatum as 
    varchar
), '') as 
    varchar
)) as _airbyte_referentie_huisaansluiting_hashid,
    tmp.*
from __dbt__cte__referentie_huisaansluiting_ab2 tmp
-- referentie_huisaansluiting
where 1 = 1
)-- Final base SQL model
-- depends_on: __dbt__cte__referentie_huisaansluiting_ab3
select
    ie,
    st_x,
    st_y,
    appnr,
    busnr,
    actief,
    huisnr,
    str_id,
    huisa_id,
    gebruiker,
    geometrie,
    _ab_cdc_lsn,
    proj_id_ibe,
    dat_wijziging,
    proj_id_aansl,
    _ab_cdc_deleted_at,
    _ab_cdc_updated_at,
    iba_plaatsingsdatum,
    iba_zekerheid_plaatsingsdatum,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at,
    _airbyte_referentie_huisaansluiting_hashid
from __dbt__cte__referentie_huisaansluiting_ab3
-- referentie_huisaansluiting from "cdc_testing".dbtfix._airbyte_raw_referentie_huisaansluiting
where 1 = 1