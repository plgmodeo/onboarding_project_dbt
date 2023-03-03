WITH union_all AS (
    SELECT *
    FROM {{ ref('bornes_de_recharges_avia') }}

    UNION ALL
    SELECT *
    FROM {{ ref('bornes_de_recharges_reseau_mobive_sdeer_17_irve_mobive') }}

    UNION ALL
    SELECT *
    FROM {{ ref('bornes_de_recharges_reseau_mobive_sehv87_irve_mobive') }}

    UNION ALL
    SELECT *
    FROM {{ ref('bornes_de_recharges_sigeif_1') }}

    UNION ALL
    SELECT *
    FROM {{ ref('bornes_de_recharges_soregies') }}

    UNION ALL
    SELECT *
    FROM {{ ref('bornes_de_recharges_wiiiz') }}

    UNION ALL
    SELECT *
    FROM {{ ref('bornes_de_recharges_zenpark') }}

    UNION ALL
    SELECT *
    FROM {{ ref('izivia_metropole_aix_marseille_provence_1') }}
)

SELECT * FROM union_all
