with kaynak as (
    select * from {{ ref('perakende_satis') }}
)

select
    SiparisID as siparis_id,
    cast(Tarih as date) as siparis_tarihi,
    Musteri_ID as musteri_id,
    Sehir as sehir,
    Bolge as bolge,
    Kanal as kanal,
    Kategori as kategori,
    Urun as urun,
    cast(Miktar as integer) as miktar,
    cast(BirimFiyat as double) as birim_fiyat,
    cast(Maliyet as double) as birim_maliyet,
    cast(IndirimOrani as double) as indirim_orani,
    -- İndirim düşülmüş net satış tutarı (Ciro):
    round(Miktar * BirimFiyat * (1 - IndirimOrani), 2) as net_tutar,
    -- Toplam maliyet:
    round(Miktar * Maliyet, 2) as toplam_maliyet,
    -- Net kar:
    round((Miktar * BirimFiyat * (1 - IndirimOrani)) - (Miktar * Maliyet), 2) as net_kar
from kaynak
where SiparisID is not null