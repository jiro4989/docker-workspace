select
  *
from
  (
    select
      p.name
      , p.position
      , p.club
      , count(g.player_id) as goal_count
    from
      goals g
      , players p
    where
      g.player_id = p.id
    group by
      g.player_id
  ) p2
order by
  goal_count desc;
