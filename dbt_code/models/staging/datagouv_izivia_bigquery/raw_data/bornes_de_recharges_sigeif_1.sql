WITH source AS (
    SELECT * FROM {{ source('bornes_irve_pierrelouis', 'bornes-de-recharges-sigeif-1') }}
),

transformed AS (
    {{ select_all_fields_of_table() }}
    FROM source
)

SELECT * FROM transformed