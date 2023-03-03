WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
),
quantity AS (
    SELECT
        region,
        COUNT(CASE WHEN accessibilite_pmr='Accessible' THEN 1 END) AS access_true,
        COUNT(CASE WHEN accessibilite_pmr='Inaccessible' THEN 1 END) access_false,
        COUNT(CASE WHEN accessibilite_pmr='Accessibilité inconnue' THEN 1 END) access_unknown
    FROM base
    WHERE region IS NOT NULL
    GROUP BY region
),
add_total AS (
    SELECT
        region,
        access_true + access_false + access_unknown AS access_total
    FROM quantity
)

SELECT
    q.region AS region,
    100.0 * access_true / access_total as access_true_pct,
    100.0 * access_false / access_total as access_false_pct,
    100.0 * access_unknown / access_total as access_unknown_pct
FROM quantity q
INNER JOIN add_total t
ON q.region=t.region
ORDER BY region ASC
