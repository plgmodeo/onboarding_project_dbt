WITH base AS (
    SELECT * FROM {{ ref('stg_datagouv_izivia_bigquery__bornes') }}
),
quantity AS (
    SELECT
        region,
        COUNT(CASE WHEN type_de_localisation='Voirie' THEN 1 END) AS voirie,
        COUNT(CASE WHEN type_de_localisation='Parking' THEN 1 END) AS parking
    FROM base
    WHERE region IS NOT NULL
    GROUP BY region
),
add_total AS (
    SELECT
        region,
        voirie + parking AS total_type_de_localisation
    FROM quantity
)

SELECT
    q.region AS region,
    100.0 * voirie / total_type_de_localisation AS voirie_pct,
    100.0 * parking / total_type_de_localisation AS parking_pct
FROM quantity q
INNER JOIN add_total t
ON q.region=t.region
ORDER BY region ASC
