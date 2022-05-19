{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbtfix",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('referentie_huisaansluiting_ab1') }}
select
    cast(ie as {{ dbt_utils.type_float() }}) as ie,
    cast(st_x as {{ dbt_utils.type_float() }}) as st_x,
    cast(st_y as {{ dbt_utils.type_float() }}) as st_y,
    cast(appnr as {{ dbt_utils.type_string() }}) as appnr,
    cast(busnr as {{ dbt_utils.type_string() }}) as busnr,
    {{ cast_to_boolean('actief') }} as actief,
    cast(huisnr as {{ dbt_utils.type_string() }}) as huisnr,
    cast(str_id as {{ dbt_utils.type_float() }}) as str_id,
    cast(huisa_id as {{ dbt_utils.type_float() }}) as huisa_id,
    cast(gebruiker as {{ dbt_utils.type_string() }}) as gebruiker,
    cast(geometrie as {{ dbt_utils.type_string() }}) as geometrie,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_float() }}) as _ab_cdc_lsn,
    cast(proj_id_ibe as {{ dbt_utils.type_float() }}) as proj_id_ibe,
    cast(dat_wijziging as {{ dbt_utils.type_string() }}) as dat_wijziging,
    cast(proj_id_aansl as {{ dbt_utils.type_float() }}) as proj_id_aansl,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}) as _ab_cdc_deleted_at,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}) as _ab_cdc_updated_at,
    cast(iba_plaatsingsdatum as {{ dbt_utils.type_string() }}) as iba_plaatsingsdatum,
    cast(iba_zekerheid_plaatsingsdatum as {{ dbt_utils.type_string() }}) as iba_zekerheid_plaatsingsdatum,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('referentie_huisaansluiting_ab1') }}
-- referentie_huisaansluiting
where 1 = 1

