-- Malith Pramuditha
-- 20926076

-- create coach table

CREATE TABLE coach (
    coachid CHAR(5) NOT NULL,
    coachname VARCHAR(36) NOT NULL,
    PRIMARY KEY (coachid)
    
);

-- create team table

CREATE TABLE team (
    teamid CHAR(6),
    teamname VARCHAR(36) NOT NULL,
    Groupname VARCHAR(10) NOT NULL,
    Coachid CHAR(3),
    captain VARCHAR(36) NOT NULL,
    PRIMARY KEY (teamid),
    FOREIGN KEY (Coachid) REFERENCES coach (coachid)
);

-- create player table

CREATE TABLE player (
    Playerid CHAR(9) NOT NULL,
    playerName VARCHAR(36) NOT NULL,
    Position VARCHAR(10) NOT NULL,
    teamid CHAR(4),
    age int,
    caps int,
    goals int,
    PRIMARY KEY (playerid),
    FOREIGN KEY (teamid) REFERENCES team (teamid)
);

-- create matches table

CREATE TABLE matches (
    matchid CHAR(6) not null,
    hometeam VARCHAR(36) not null ,
    awayteam VARCHAR(36) not null,
    hometeam_score INT,
    awayteam_score Int,
    winner VARCHAR(36),
    teamid CHAR(4),
    matchdate DATE,
    stadium VARCHAR(24),
    PRIMARY KEY (matchid),
    FOREIGN KEY (teamid) REFERENCES team (teamid)
);

-- create champ table

CREATE TABLE champ (
    champid CHAR(6),
    champ_name VARCHAR(30),
    matchid CHAR(6) NOT NULL,
    teamid CHAR(4),
    PRIMARY KEY (champid),
    FOREIGN KEY (matchid) REFERENCES matches (matchid),
    FOREIGN KEY (teamid) REFERENCES team (teamid)
);

















































