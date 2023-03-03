WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
),
quantity AS (
    SELECT
        region,
        COUNT(CASE WHEN restriction_gabarit='Aucune Restriction' THEN 1 END) AS no_restrictions,
        COUNT(CASE WHEN restriction_gabarit='Restrictions' THEN 1 END) AS some_restrictions,
        COUNT(CASE WHEN restriction_gabarit='Restrictions inconnue' THEN 1 END) AS unknown_restrictions
    FROM base
    WHERE region IS NOT NULL
    GROUP BY region
),
add_total AS (
    SELECT
        region,
        no_restrictions + some_restrictions + unknown_restrictions AS total_restrictions
    FROM quantity
)

SELECT
    q.region AS region,
    100.0 * no_restrictions / total_restrictions AS no_restrictions_pct,
    100.0 * some_restrictions / total_restrictions AS some_restrictions_pct,
    100.0 * unknown_restrictions / total_restrictions AS unknown_restrictions_pct
FROM quantity q
INNER JOIN add_total t
ON q.region=t.region
ORDER BY region ASC
