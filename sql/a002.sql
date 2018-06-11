SELECT
    AVG(height) AS 平均身長
  , AVG(weight) AS 平均体重
FROM players
WHERE position = 'GK';
