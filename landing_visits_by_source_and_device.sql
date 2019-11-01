SELECT
  trafficSource.source,
  trafficSource.campaign,
  device.isMobile AS mobile,
  COUNT(DISTINCT visitId) AS visits
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/home'
  AND hits.type = 'PAGE'
GROUP BY
  trafficSource.source,
  trafficSource.campaign,
  device.isMobile
ORDER BY
  visits DESC
