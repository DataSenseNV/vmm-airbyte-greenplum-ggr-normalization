{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbtfix",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('dbtfix', '_airbyte_raw_referentie_huisaansluiting') }}
select
    {{ json_extract_scalar('_airbyte_data', ['ie'], ['ie']) }} as ie,
    {{ json_extract_scalar('_airbyte_data', ['st_x'], ['st_x']) }} as st_x,
    {{ json_extract_scalar('_airbyte_data', ['st_y'], ['st_y']) }} as st_y,
    {{ json_extract_scalar('_airbyte_data', ['appnr'], ['appnr']) }} as appnr,
    {{ json_extract_scalar('_airbyte_data', ['busnr'], ['busnr']) }} as busnr,
    {{ json_extract_scalar('_airbyte_data', ['actief'], ['actief']) }} as actief,
    {{ json_extract_scalar('_airbyte_data', ['huisnr'], ['huisnr']) }} as huisnr,
    {{ json_extract_scalar('_airbyte_data', ['str_id'], ['str_id']) }} as str_id,
    {{ json_extract_scalar('_airbyte_data', ['huisa_id'], ['huisa_id']) }} as huisa_id,
    {{ json_extract_scalar('_airbyte_data', ['gebruiker'], ['gebruiker']) }} as gebruiker,
    {{ json_extract_scalar('_airbyte_data', ['geometrie'], ['geometrie']) }} as geometrie,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['proj_id_ibe'], ['proj_id_ibe']) }} as proj_id_ibe,
    {{ json_extract_scalar('_airbyte_data', ['dat_wijziging'], ['dat_wijziging']) }} as dat_wijziging,
    {{ json_extract_scalar('_airbyte_data', ['proj_id_aansl'], ['proj_id_aansl']) }} as proj_id_aansl,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['iba_plaatsingsdatum'], ['iba_plaatsingsdatum']) }} as iba_plaatsingsdatum,
    {{ json_extract_scalar('_airbyte_data', ['iba_zekerheid_plaatsingsdatum'], ['iba_zekerheid_plaatsingsdatum']) }} as iba_zekerheid_plaatsingsdatum,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('dbtfix', '_airbyte_raw_referentie_huisaansluiting') }} as table_alias
-- referentie_huisaansluiting
where 1 = 1

