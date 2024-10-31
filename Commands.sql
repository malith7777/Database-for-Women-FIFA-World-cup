-- Malith Pramuditha
-- 20926076

-- Part 3

-- get championship name and matchid
SELECT champ_name, matchid FROM champ;

-- get matches that occurred after specific date
SELECT * FROM matches WHERE matchdate > '2023-07-25';

-- get players above specific age
SELECT playerName, age
FROM player
WHERE age > 25;

-- get playername, age and caps above specific caps
SELECT playerName, age, caps   
FROM player 
WHERE caps > 75;

-- get playername, age and goals above specific goals
select playername, age, goals
from player
WHERE goals > 5;

-- get player information with minimum number of goals
SELECT p.playerName, p.goals
FROM player p
WHERE p.goals = (SELECT MIN(goals) FROM player);

-- get team and coach information between coach and team
SELECT t.teamname, c.coachname
FROM team t
LEFT JOIN coach c ON t.Coachid = c.coachid;

-- get playername, position, teamname between plaey and team
SELECT p.playerName, p.Position, t.teamname
FROM player p
JOIN team t ON p.teamid = t.teamid;

-- get coount the number of matches all teams.
SELECT t.teamname, COUNT(m.matchid) AS match_count
FROM team t
LEFT JOIN matches m ON t.teamid = m.teamid
GROUP BY t.teamname;

