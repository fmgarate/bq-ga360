-- Total leads by source ad device
-- Replace page path with your own landing path.

SELECT
  trafficSource.source,
  device.isMobile AS mobile,
  COUNT(DISTINCT visitId) AS total_leads
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/home'
GROUP BY
  trafficSource.source,
  device.isMobile
ORDER BY
  total_leads DESC
