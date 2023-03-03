WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
),
quantity AS (
    SELECT
        region,
        COUNT(CASE WHEN raccordement='Direct' THEN 1 END) AS direct,
        COUNT(CASE WHEN raccordement='Indirect' THEN 1 END) AS indirect
    FROM base
    WHERE region IS NOT NULL
    GROUP BY region
),
add_total AS (
    SELECT
        region,
        direct + indirect AS total_raccordement
    FROM quantity
)

SELECT
    q.region AS region,
    100.0 * direct / total_raccordement AS raccordement_direct_pct,
    100.0 * indirect / total_raccordement AS raccordement_indirect_pct
FROM quantity q
INNER JOIN add_total t
ON q.region=t.region
ORDER BY region ASC
