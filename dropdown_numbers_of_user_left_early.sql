-- Numbers of User Left Early
-- This query counts the amount of user that triggered the "Left Early" custom event.

-- Assuming a custom event generated on window close event with action "Left Early".
-- Replace page path with your own watch video path.

SELECT
  COUNT ( visitId ) AS left_early
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/watch'
  AND hits.eventInfo.eventAction = 'Left Early'
