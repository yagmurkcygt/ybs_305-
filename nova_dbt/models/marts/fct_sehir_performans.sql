with satislar as (
    select * from {{ ref('stg_satislar') }}
),

nufus as (
    select * from {{ ref('stg_nufus') }}
),

sehir_ozet as (
    select
        sehir,
        bolge,
        count(distinct siparis_id) as toplam_siparis_sayisi,
        count(distinct musteri_id) as tekil_musteri_sayisi,
        sum(miktar) as toplam_urun_adedi,
        round(sum(net_tutar), 2) as toplam_ciro,
        round(sum(net_kar), 2) as toplam_kar,
        round(avg(net_tutar), 2) as ortalama_sepet_tutari
    from satislar
    group by sehir, bolge
)

select
    s.sehir,
    s.bolge,
    n.nufus,
    n.enlem,
    n.boylam,
    s.toplam_siparis_sayisi,
    s.tekil_musteri_sayisi,
    s.toplam_urun_adedi,
    s.toplam_ciro,
    s.toplam_kar,
    s.ortalama_sepet_tutari,
    -- 1000 kişi başına düşen ciro (Nüfus etkisini kıyaslamak için):
    round((s.toplam_ciro / n.nufus) * 1000, 2) as bin_kisi_basi_ciro
from sehir_ozet s
left join nufus n on s.sehir = n.sehir