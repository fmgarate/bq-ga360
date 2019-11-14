-- Sessions on Landing Page (from source and overall)
-- Replace page path with your own landing path.

SELECT
  SUM(totals.visits) AS total_sessions
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/home'
ORDER BY
  total_sessions DESC
