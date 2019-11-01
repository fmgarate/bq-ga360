SELECT
  trafficSource.source,
  trafficSource.campaign,
  COUNT(totals.bounces)/COUNT(totals.visits) AS bounce_rate
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/home'
  AND hits.type = 'PAGE'
GROUP BY
  trafficSource.source,
  trafficSource.campaign
