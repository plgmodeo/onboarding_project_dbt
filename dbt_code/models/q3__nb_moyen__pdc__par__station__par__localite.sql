WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
)

SELECT
    region,
    AVG(nombre_pdc) AS nombre_pdc,
FROM base
WHERE region IS NOT NULL
GROUP BY region
ORDER BY nombre_pdc DESC, region ASC
