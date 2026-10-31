with source as (
    select * from {{ ref('tatiller') }}
)

select
    cast(Tarih as date) as tatil_tarihi,
    TatilAdi as tatil_adi,
    TatilTuru as tatil_turu
from source