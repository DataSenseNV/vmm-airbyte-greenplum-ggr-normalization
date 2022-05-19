{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbtfix",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('referentie_huisaansluiting_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'ie',
        'st_x',
        'st_y',
        'appnr',
        'busnr',
        boolean_to_string('actief'),
        'huisnr',
        'str_id',
        'huisa_id',
        'gebruiker',
        'geometrie',
        '_ab_cdc_lsn',
        'proj_id_ibe',
        'dat_wijziging',
        'proj_id_aansl',
        '_ab_cdc_deleted_at',
        '_ab_cdc_updated_at',
        'iba_plaatsingsdatum',
        'iba_zekerheid_plaatsingsdatum',
    ]) }} as _airbyte_referentie_huisaansluiting_hashid,
    tmp.*
from {{ ref('referentie_huisaansluiting_ab2') }} tmp
-- referentie_huisaansluiting
where 1 = 1

