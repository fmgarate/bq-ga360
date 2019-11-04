-- People Buying Product at different timings of Dropdown

-- Assuming a custom event generated from the checkout page with action "Sale".
-- Replace page path with your own checkout page path.

SELECT
  hits.time,
  COUNT ( visitId ) AS total
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/checkout'
  AND hits.type = 'TRANSACTION'
GROUP BY
  hits.time
ORDER BY
  hits.time
