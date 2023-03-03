WITH source AS (
    SELECT * FROM {{ source('bornes_irve_pierrelouis', 'bornes-de-recharges-soregies') }}
),

transformed AS (
    {{ select_all_fields_of_table() }}
    FROM source
)

SELECT * FROM transformed