with kaynak as (
    select * from {{ ref('turkey_city_populations') }}
)

select
    sehir,
    enlem,
    boylam,
    cast(replace(nufus, '.', '') as integer) as nufus
from kaynak