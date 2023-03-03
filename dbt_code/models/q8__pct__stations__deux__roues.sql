WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
)

SELECT
    region,
    COUNT(CASE WHEN station_deux_roues=true THEN 1 END)*100.0 / (1e-18 + SUM(COUNT(id)) OVER(PARTITION BY region)) AS nombre_stations_deux_roues_pct
FROM base
WHERE region IS NOT NULL
GROUP BY region
ORDER BY nombre_stations_deux_roues_pct DESC, region ASC
