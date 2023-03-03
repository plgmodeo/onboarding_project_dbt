# Onboarding Project Dbt

### Main folders

* _macros/_
* _models/_

### Structure

Les données brutes arrivent de BigQuery dans models/staging/datagouv_izivia_bigquery/_raw_data_/
et certaines subissent des nettoyages.

Elles sont ensuites fusionnées dans models/staging/datagouv_izivia_bigquery/raw_data/_datagouv_izivia_8_cleaned.sql_

Jusque là ce ne sont que des vues, ensuite ce sont des tables.

Les données subissent leurs dernières modifications dans models/staging/datagouv_izivia_bigquery/_stg_datagouv_izivia_bigquery__bornes.sql_

Pour créer les KPIs que nous nous sommes fixés dans le docx, je numérote les tables de q1 à q13 (juste pour repérer plus rapidement quel code répond à quel question).