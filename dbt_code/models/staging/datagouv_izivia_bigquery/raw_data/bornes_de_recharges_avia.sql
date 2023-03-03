WITH source AS (
    SELECT * FROM {{ source('bornes_irve_pierrelouis', 'bornes-de-recharges-avia') }}
),

transformed AS (
    SELECT
        int64_field_0,
        nom_amenageur,
        siren_amenageur,
        contact_amenageur,
        nom_operateur,
        contact_operateur,
        telephone_operateur,
        nom_enseigne,
        id_station_itinerance,
        id_station_local,
        nom_station,
        implantation_station,
        adresse_station,
        CAST(code_insee_commune AS INT64) AS code_insee_commune,
        coordonneesXY,
        nbre_pdc,
        id_pdc_itinerance,
        id_pdc_local,
        puissance_nominale,
        prise_type_ef,
        prise_type_2,
        prise_type_combo_ccs,
        prise_type_chademo,
        prise_type_autre,
        gratuit,
        paiement_acte,
        paiement_cb,
        paiement_autre,
        tarification,
        condition_acces,
        reservation,
        horaires,
        accessibilite_pmr,
        restriction_gabarit,
        station_deux_roues,
        raccordement,
        CAST(num_pdl AS STRING) AS num_pdl,
        date_mise_en_service,
        observations,
        date_maj
    FROM source
)

SELECT * FROM transformed