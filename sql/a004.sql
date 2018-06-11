-- サブクエリとかあったのか...。わけわかめ。
SELECT
    (SELECT c.name FROM countries c WHERE c.id = p.country_id)
  , AVG(p.height)
FROM players p
GROUP BY p.country_id
ORDER BY AVG(p.height) DESC;

