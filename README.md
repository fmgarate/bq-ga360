# Google Analytics 360 and BigQuery

This repo collects a set of queries for an exported Google Analytics 360 dataset into BigQuery.


## Google Analytics sample dataset for BigQuery

The sample dataset provides an obfuscated Google Analytics 360 dataset that can be accessed via BigQuery. It’s a great way to look at business data and experiment and learn the benefits of analyzing Google Analytics 360 data in BigQuery.
https://support.google.com/analytics/answer/7586738


## How to run queries

### Using the GCP console:

- Open the BigQuery web UI in the GCP Console.
- Click Compose new query.
- Enter a valid BigQuery SQL query in the Query editor text area.
- Click Run.


### Using the command line:

Open a command line console and execure this command (Google Cloud SDK is required):
```bash
bq query --use_legacy_sql=false $(cat landing_visits_by_source.sql)
```
