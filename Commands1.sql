-- Malith Pramuditha
-- 20926076



-- Part 4

-- get player information according to the teamid
DELIMITER //

CREATE PROCEDURE PlayerInfo(IN team_id CHAR(4))
BEGIN
    SELECT * FROM player WHERE teamid = team_id;
END //

DELIMITER ;

-- execute
CALL PlayerInfo('T04');

-- update the number of golas of given player
DELIMITER //

CREATE PROCEDURE PlayerGoals(IN player_id CHAR(9), IN new_goals INT)
BEGIN
    UPDATE player SET goals = new_goals WHERE Playerid = player_id;
END //

DELIMITER ;

-- execute
CALL PlayerGoals('P100', 10);

-- get details about each macth according to the matchid
DELIMITER //

CREATE PROCEDURE MatchInfo(IN match_id CHAR(6))
BEGIN
    SELECT * FROM matches WHERE matchid = match_id;
END //

DELIMITER ;

-- execute
CALL MatchInfo('M01');


-- trigger 1
-- update the number of caps of winner team each player if new match insert.
DELIMITER //

CREATE TRIGGER CapsOnMatch
AFTER INSERT ON matches
FOR EACH ROW
BEGIN
    UPDATE player SET caps = caps + 1 WHERE player.teamid = NEW.teamid;
END //

DELIMITER ;

-- trigger 2
-- prevent deletion of coach
DELIMITER //

CREATE TRIGGER stopCoachDelete
BEFORE DELETE ON coach
FOR EACH ROW
BEGIN
    DECLARE coach_count INT;
    SELECT COUNT(*) INTO coach_count FROM team WHERE Coachid = OLD.coachid;

    IF coach_count > 0 THEN
        SIGNAL SQLSTATE '55000' SET MESSAGE_TEXT = 'Cannot delete Coach.';
    END IF;
END //

DELIMITER ;

