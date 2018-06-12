select kickoff, c.name, cc.name from pairings p left join countries c on p.my_country_id = c.id left join countries cc on p.my_country_id = cc.id order by kickoff;
