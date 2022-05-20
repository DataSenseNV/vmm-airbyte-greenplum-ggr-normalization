
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