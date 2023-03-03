WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
)

SELECT
    region,
    nom_operateur,
    DATE_ADD('1900-01-01', INTERVAL CAST(AVG(DATE_DIFF(date_maj, '1900-01-01', DAY)) AS INTEGER) DAY) AS avg_date_maj
FROM base
WHERE region IS NOT NULL AND nom_operateur IS NOT NULL
GROUP BY region, nom_operateur
ORDER BY avg_date_maj DESC, region ASC
