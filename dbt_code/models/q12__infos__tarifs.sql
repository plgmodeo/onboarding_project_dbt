WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
)

SELECT
    region,
    nom_operateur,
    tarification
FROM base
WHERE region IS NOT NULL AND nom_operateur IS NOT NULL
GROUP BY region, nom_operateur, tarification
ORDER BY region ASC
