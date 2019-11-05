-- Total leads by source
-- Replace page path with your own landing path.

SELECT
  trafficSource.source,
  COUNT(DISTINCT visitId) AS total_leads
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/home'
GROUP BY
  trafficSource.source
ORDER BY
  total_leads DESC
