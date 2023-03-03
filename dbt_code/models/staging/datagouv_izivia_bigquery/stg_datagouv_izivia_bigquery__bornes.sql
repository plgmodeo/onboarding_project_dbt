WITH source AS (
    SELECT * FROM {{ ref('datagouv_izivia_8_cleaned') }}
),

transformed AS (
    SELECT
        ROW_NUMBER() OVER() AS id,
        nom_operateur,
        code_insee_commune,
        CAST(code_insee_commune / 1000 AS INTEGER) AS region,
        implantation_station AS type_de_localisation,
        nbre_pdc AS nombre_pdc,
        prise_type_ef,
        prise_type_2,
        prise_type_combo_ccs,
        prise_type_chademo,
        prise_type_autre,
        gratuit,
        paiement_acte,
        paiement_cb,
        paiement_autre,
        accessibilite_pmr,
        restriction_gabarit,
        station_deux_roues,
        raccordement,
        CAST(date_mise_en_service AS DATE) AS date_mise_en_service,
        CAST(date_maj AS DATE) AS date_maj,
        tarification,
        horaires
    FROM
        source
)

SELECT * FROM transformed
