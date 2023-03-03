WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
)

SELECT
    region,
    COUNT(id) AS nombre_stations
FROM base
GROUP BY region
ORDER BY nombre_stations DESC, region ASC
