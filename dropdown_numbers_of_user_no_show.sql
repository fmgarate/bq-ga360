-- Number of Users - No Show
-- This query counts the amount of user that triggered the "No Show" custom event.

-- Assuming a custom event generated with action "No Show".
-- Replace page path with your own late path.

SELECT
  COUNT ( visitId ) AS saw_dropdown
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/late'
  AND hits.eventInfo.eventAction = 'No Show'
