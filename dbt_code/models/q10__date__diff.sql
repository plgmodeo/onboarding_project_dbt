WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
)

SELECT
    region,
    ROUND(AVG(DATE_DIFF(date_maj, date_mise_en_service, DAY)), 2) AS avg_date_diff
FROM base
WHERE region IS NOT NULL
GROUP BY region
ORDER BY avg_date_diff DESC, region ASC
