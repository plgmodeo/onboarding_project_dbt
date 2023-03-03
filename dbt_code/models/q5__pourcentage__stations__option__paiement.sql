WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
)

SELECT
    region,
    AVG(CAST(gratuit AS INTEGER))*100.0 AS gratuit,
    AVG(CAST(paiement_acte AS INTEGER))*100.0 AS paiement_acte,
    AVG(CAST(paiement_cb AS INTEGER))*100.0 AS paiement_cb,
    AVG(CAST(paiement_autre AS INTEGER))*100.0 AS paiement_autre
FROM base
WHERE region IS NOT NULL
GROUP BY region
ORDER BY region ASC