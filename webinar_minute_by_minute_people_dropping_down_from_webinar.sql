-- Minute by Minute People dropping down from Webinar

-- Assuming a custom event generated on window close event with action "Leave Webinar".
-- Replace page path with your own webinar video page path.

SELECT
  hits.time,
  COUNT ( visitId ) AS total
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  _TABLE_SUFFIX BETWEEN '20170701'
  AND '20170731'
  AND hits.page.pagePath = '/watch'
  AND hits.eventInfo.eventAction = 'Leave Webinar'
GROUP BY
  hits.time
ORDER BY
  hits.time
