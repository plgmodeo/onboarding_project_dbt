WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
)

SELECT
    region,
    ROUND(AVG(CAST(prise_type_ef AS INTEGER))*100.0, 2) AS prise_type_ef,
    ROUND(AVG(CAST(prise_type_2 AS INTEGER))*100.0, 2) AS prise_type_2,
    ROUND(AVG(CAST(prise_type_combo_ccs AS INTEGER))*100.0, 2) AS prise_type_combo_ccs,
    ROUND(AVG(CAST(prise_type_chademo AS INTEGER))*100.0, 2) AS prise_type_chademo,
    ROUND(AVG(CAST(prise_type_autre AS INTEGER))*100.0, 2) AS prise_type_autre
FROM base
WHERE region IS NOT NULL
GROUP BY region
ORDER BY region ASC