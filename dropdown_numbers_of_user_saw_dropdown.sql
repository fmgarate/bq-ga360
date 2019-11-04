-- Number of Users Delayed Event (Saw Dropdown)
-- This query counts the amount of user that triggered the "Saw Dropdown" custom event.

-- Assuming a custom event generated with action "Saw Dropdown".
-- Replace page path with your own offer path.

SELECT
  COUNT ( visitId ) AS saw_dropdown
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND hits.page.pagePath = '/offer/dropdown'
  AND hits.eventInfo.eventAction = 'Saw Dropdown'
