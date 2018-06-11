select
    countries.name
  , AVG(players.height) AS avg_height
FROM countries
INNER JOIN players ON countries.id = players.country_id
GROUP BY countries.name
ORDER BY avg_height DESC;
