select
  birth
  , timestampdiff(YEAR, birth, '2014-06-13') as age
  , name
  , position
from
  players
order by
  birth;
