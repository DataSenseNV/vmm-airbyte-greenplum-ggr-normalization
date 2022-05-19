{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "dbtfix",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('referentie_huisaansluiting_ab3') }}
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
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_referentie_huisaansluiting_hashid
from {{ ref('referentie_huisaansluiting_ab3') }}
-- referentie_huisaansluiting from {{ source('dbtfix', '_airbyte_raw_referentie_huisaansluiting') }}
where 1 = 1

