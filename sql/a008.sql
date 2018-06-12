select
  p.position
  , count(g.id) as count
from
  players p
left join
  goals g
  on g.player_id = p.id
group by
  p.position
order by
  count desc;
