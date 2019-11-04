# Landing bounce rate

SELECT
  source,
  total_visits,
  total_no_of_bounces,
  ( ( total_no_of_bounces / total_visits ) * 100 ) AS bounce_rate
FROM (
  SELECT
    trafficSource.source AS source,
    COUNT ( trafficSource.source ) AS total_visits,
    SUM ( totals.bounces ) AS total_no_of_bounces
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
    UNNEST(hits) AS hits
  WHERE
    _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
    AND hits.page.pagePath = '/home'
  GROUP BY
    source)
ORDER BY
  total_visits DESC
