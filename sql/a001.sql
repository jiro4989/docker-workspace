SELECT
    group_name
  , MIN(ranking)
  , MAX(ranking)
FROM countries
GROUP BY group_name;
