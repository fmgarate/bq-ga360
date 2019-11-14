-- People Selecting Watch Now (from source and overall)
-- Replace page path with your own landing path.

SELECT
  COUNT(DISTINCT visitId) AS total_watch_now
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/home'
  AND hits.eventInfo.eventAction = 'Signup'
  AND hits.eventInfo.eventLabel = 'Watch Now'
ORDER BY
  total_watch_now DESC
