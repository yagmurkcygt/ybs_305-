|Perakende Satış Analitiği: Demografik Nüfus ve Tatil Takvimi Entegrasyonu|
Proje Hakkında
Perakende satış verilerinin Türkiye'nin şehir nüfusu ve resmi/özel takvimi ile zenginleştirildiği, dbt ve DuckDB tabanlı veri analitiği ve iş zekâsı (BI) projesidir.
Perakende sektöründe ham satış verilerine bakmak işletmeler için sıkıntılı sonuçlar oluşturabilir. Projemiz, Türkiye'nin nüfus verileri ve tatil günlerini satış verileriyle birleştirerek, satışların bu faktörlerden nasıl etkilendiğini ve işletmelerin bu etkilenmeye göre doğru satış politikaları geliştirmesine yardımcı olmayı amaçlamaktadır.

Proje Amaçları
Satış Verilerinin Temizlenmesi: Ham olarak alınan perakende satış verilerinin analize uygunluğunun test edilmesi.
Demografik Analiz: Türkiye nüfus verilerinin şehir isimleri baz alınarak satış verileriyle eşleşecek hale getirilmesi.
Tatil Takvimi Analizi: resmi tatil, dini bayram ve özel günlerin satışlara etkisi.
Modüler Veri Hattı (dbt): Staging katmanında temizlenen satış ve nüfus modellerinin  Marts katmanında birleştirilerek; şehir bazında toplam ciro, net kâr, ortalama sepet tutarı ve bin kişi başına düşen ciro metriklerinin üretilmesi.
Dashboard (Looker Studio): Modelleme çıktılarının Türkiye'nin nüfusu ve tatil günü satışları verilerinin dışa aktarılarak grafik üstünde gösterilmesi.

Kullanılan Teknolojiler
Veri Dönüşümü ve Modelleme (SQL): Ham satış, nüfus, tatil verilerini temizlemek ve analiz tablolarına dönüştürmek için kullanıldı.
Veritabanı/Veri Ambarı (DuckDB): Hızlı analitik veritabanı olarak kullanıldı.
Görselleştirme (Google Looker Studio): Modelleme ile oluşan ortak verilerin pasta grafiği, performans tabloları vs. ile görselleştirilmesi için kullanıldı.
Programlama: Python (venv, pip): Paketlerinin (dbt-core ve dbt-duckdb paketlerinin) kurulumu ve sanal ortam yönetimi için kullanıldı.
Kontrol-Proje Birleşim (GitHub): Ekip olarak eşgüdümlü çalışmak ve projeyi birleştirmek için kullanıldı.
Geliştirme Ortamı: Visual Studio Code (VS Code): SQL modellerinin, YAML yapılarının ve README.md dosyasının yazılması için kullanıldı.

Veri Kaynakları
Perakende Satış Verisi: Ders içeriğinde hazır bulunan ana veri setidir. İçerisinde sipariş kimliği, sipariş tarihleri, müşteri kimliği, şehirler, bölge, kanal, kategori, ürün, ürün adeti, birim fiyat, satış tutarı, maliyet, indirim oranı bilgileri bulunmaktadır.
Türkiye Şehir Nüfus Verisi: Şehirlerin demografik büyüklüklerini analize dahil edip farklı bir bakış kazandırmak amacıyla projeye eklenmiştir. İl nüfus sayılarını içerir ve şehirlerin nüfusa oranla gerçek satış performansını ölçmek için kullanılmıştır.
Tatiller Verisi: Tatil dönemlerinin satışlara etkisini ölçmek amacıyla projeye eklenmiştir. Dini bayram, resmî tatil, normal gün, özel gün, kampanya dönemlerinin tarihlerini içerir ve tatil günlerindeki satış değişimlerini analiz etmek için kullanılmıştır.

Proje Klasör Yapısı
```text

perakende\_projesi/

├── data/                                     # Ham veriler ve analiz çıktı dosyaları

│   ├── fct\_ortak\_dashboard.csv               # Birleştirilmiş ortak dashboard verisi

│   ├── perakende\_satis.xlsx                  # Ham perakende satış veri seti (Excel)

│   ├── powerbi\_satislar\_detay.csv            # Detaylı satış verisi çıktısı

│   ├── powerbi\_sehir\_performans.csv          # Şehir bazlı performans analizi çıktısı

│   ├── tatiller.csv                          # Resmi ve özel tatil takvimi verisi

│   └── turkey\_city\_populations.csv           # Türkiye il bazlı nüfus verisi

├── logs/                                     # Sistem ve çalışma kayıtları (Loglar)

├── nova\_dbt/                                 # dbt (data build tool) proje klasörü

│   ├── analyses/                             # Analitik sorgular klasörü

│   ├── macros/                               # Yeniden kullanılabilir SQL makroları

│   ├── models/                               # SQL veri dönüşüm modelleri

│   │   ├── marts/                            # Sunum ve analiz katmanı

│   │   │   └── fct\_sehir\_performans.sql      # Birleştirilmiş şehir ve satış performans modeli

│   │   ├── staging/                          # Veri temizleme ve hazırlık katmanı

│   │   │   ├── stg\_nufus.sql                 # Nüfus verisi temizleme modeli

│   │   │   ├── stg\_satislar.sql              # Satış verisi temizleme modeli

│   │   │   └── stg\_tatiller.sql              # Tatil verisi temizleme modeli

│   │   └── schema.yml                        # Veri kalitesi testleri ve model tanımları

│   ├── seeds/                                # Veritabanına yüklenen CSV kaynakları

│   │   ├── perakende\_satis.csv               # Ham satış verisi (Seed)

│   │   ├── tatiller.csv                      # Tatil takvimi verisi (Seed)

│   │   └── turkey\_city\_populations.csv       # Şehir nüfus verisi (Seed)

│   ├── snapshots/                            # Veri geçmişi takip klasörü

│   ├── tests/                                # Özel veri doğrulama testleri

│   ├── dbt\_project.yml                       # dbt proje yapılandırma dosyası

│   ├── dev.duckdb                            # DuckDB yerel veri ambarı dosyası

│   └── README.md                             # dbt klasör dokümantasyonu

├── README.md                                 # Ana proje tanıtım ve dokümantasyon dosyası

└── sehir\_ve\_satis\_performans\_raporu.pbix     # Power BI görselleştirme ve rapor dosyası

Kurulum
**Repositoryi bilgisayara klonla. (GitHub'da bulunan proje dosyalarının bir kopyasını kendi bilgisayarına indirmek):**

 ```bash
 git clone \[https://github.com/yagmurkcygt/ybs\_305.git](https://github.com/yagmurkcygt/ybs\_305-.git) cd ybs\_305-

**Virtual Environment (sanal ortam) oluşturun: (Sanal ortam, Python projelerinde kullanılan kütüphaneleri ve paketleri birbirinden bağımsız tutmaya yarayan özel bir çalışma alanıdır.)**

python -m venv venv
venv\\Scripts\\activate  

**Gerekli kütüphaneleri (dbt ve DuckDB) yükleyin: (Bu ifade, oluşturduğumuz sanal ortamın içine dbt ve DuckDB paketlerini kurmamız gerektiği anlamına geliyor. DuckDB verilerin üzerinde çalıştığımız yer, dbt ise bu verileri nasıl düzenleyeceğimizi yönettiğimiz araçtır.)**

pip install dbt-core dbt-duckdb

**dbt proje klasörüne geçiş yapın: (Bu ifade, VS Code terminalinde dbt projenin bulunduğu klasöre gitmen anlamına geliyor.)**

cd nova\_dbt

**Veri hattını (Pipeline) çalıştırın ve test edin: (Veri hattını (Pipeline) çalıştırın ve test edin demek, hazırladığımız verilerin başlangıçtan sona kadar doğru şekilde işlenmesini sağlamak ve kontrollerini yapmak demektir.)**

dbt seed   # CSV veri kaynaklarını (satış, nüfus, tatiller) DuckDB'ye yükler

dbt run    # Staging ve Marts katmanındaki SQL modellerini çalıştırır

dbt test   # Veri kalitesi ve doğrulama testlerini kontrol ede

Çalıştırma
**Kurulum adımları tamamlandıktan sonra veri hattını (data pipeline) çalıştırmak ve analiz çıktılarını üretmek için sırasıyla aşağıdaki adımlar uygulanır:**

```bash
cd nova\_dbt
dbt debug

**Ham veri setlerini (CSV) DuckDB veritabanına yükleyin:**

dbt seed

**SQL dönüşüm modellerini çalıştırın:**

Bash

**SQL dönüşüm modellerini çalıştırın:**

dbt run

**Veri kalitesi testlerini gerçekleştirin:**

dbt test

**Görselleştirme ve Raporlama (Dashboard):**

Veri Dönüşüm Modelleri
Projedeki veri dönüşüm süreçleri dbt (data build tool) kullanılarak iki ana katmanda modellenmiştir:  

A. Staging Katmanı (models/staging/): Ham veri kaynaklarının (seeds) ilk kez içeri alındığı, sütun isimlerinin standartlaştırıldığı ve veri tiplerinin temizlendiği hazırlık katmanıdır.   
stg\_satislar.sql: Ham perakende satış verilerindeki sipariş tarihi, şehir, miktar, ciro ve kâr sütunlarını temizleyerek analize hazır hale getirir.   
stg\_nufus.sql: Türkiye il bazlı nüfus verilerini temizler ve şehir isimlerini satış tablosuyla eşleşecek standart formata dönüştürür.   
stg\_tatiller.sql: Resmi tatil, dini bayram, özel gün ve kampanya tarihlerini içeren takvim verisini tarih formatında düzenler.  

B. Marts Katmanı (models/marts/): Staging katmanında temizlenen tabloların birleştirildiği (JOIN) ve iş zekası (BI) raporlaması için nihai metriklerin üretildiği analiz katmanıdır.   
fct\_sehir\_performans.sql: Temizlenmiş satış ve nüfus modellerini şehir bazında birleştirerek; toplam ciro (toplam\_ciro), toplam kâr (toplam\_kar), ortalama sepet tutarı (ortalama\_sepet\_tutari), tekil müşteri sayısı ve nüfusa oranlanmış bin kişi başına düşen ciro (bin\_kisi\_basi\_ciro) metriklerini hesaplar. 

C. Test ve Dokümantasyon (models/schema.yml): Oluşturulan modellerdeki anahtar sütunların boş değer içermemesi (not\_null) ve tekil olması (unique) gibi veri kalitesi kurallarını tanımlar.   

Veri Testleri 
Veri hattının (pipeline) güvenilirliğini sağlamak ve birleştirilen tabloların hatasız olduğunu doğrulamak amacıyla models/schema.yml dosyası içerisinde dbt veri kalitesi testleri tanımlanmıştır. Terminalde dbt test komutu çalıştırılarak aşağıdaki kontroller gerçekleştirilir:   

Boş Değer Kontrolü (not\_null): Şehir isimleri, sipariş tarihleri, satış tutarları ve nüfus bilgileri gibi kritik sütunlarda eksik/boş (NULL) veri bulunmadığını doğrular.
Tekillik Kontrolü (unique): İl bazlı nüfus (stg\_nufus), tatil takvimi (stg\_tatiller) ve şehir performans özet tablosunda (fct\_sehir\_performans) anahtar sütunların (örneğin şehir adının veya tatil tarihinin) tekrar eden kayıt içermediğini kontrol eder.   
Şema ve Model Doğrulaması: Staging (stg\_) ve Marts (fct\_) katmanları arasındaki veri akışının veri tipleriyle uyumlu ve eksiksiz çalıştığını test eder.   

Dashboard ve KPI'lar 
Veri modelleme sürecinin sonunda elde edilen birleştirilmiş tablolar karar alıcılara sunulmak üzere Google Looker Studio üzerinde interaktif bir dashboard'a dönüştürülmüştür.

Takip Edilen Temel KPI'lar (Metrikler):
Toplam Ciro (toplam\_ciro): Şehir ve dönem bazında elde edilen toplam brüt satış geliri.
Toplam Kâr (toplam\_kar): Maliyetler düşüldükten sonra kalan net kazanç tutarı.

Dashboard Görselleştirmeleri:
Şehir Performans Haritası ve Tablosu: Türkiye illerinin nüfus büyüklüklerine göre satış ve kârlılık karşılaştırması.
Tatil Dönemi Satış Dağılımı (Pasta / Sütun Grafiği): Satışların normal günler ile Resmi Tatil, Dini Bayram, Özel Gün ve Kampanya dönemlerine göre yüzdesel dağılımı.
Zaman Serisi ve Kategori Kırılımları: Siparişlerin tarih ve ürün kategorilerine göre değişim trendleri.

Proje Ekibi 
Yağmur KOÇYİĞİT- Türkiye il bazlı nüfus veri setinin entegrasyonu, şehir bazlı performans ve kişi başı ciro metriklerinin dbt ile modellenmesi.
Osman Buğra DELİBAŞ- Resmi, dini ve özel günleri içeren tatil takvimi veri setinin entegrasyonu, tatil dönemlerinin satış hacmine etkisinin dbt ile modellenmesi.cd perakende_projesi