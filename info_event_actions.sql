-- List unique custom event actions.

SELECT
  DISTINCT hits.eventInfo.eventAction
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.type = 'EVENT'
