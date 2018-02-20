USE BowlingLeagueExample;

show tables;

# Number of teams
SELECT * FROM Teams;
SELECT * FROM Teams;
SELECT * FROM Bowlers;
SELECT * FROM Match_Games;

#	“List all the tournaments, the tournament matches, and the game results.”
SELECT TOURNAMENTS.TourneyID AS Tourney,
TOURNAMENTS.TourneyLocation AS Location,
Tourney_Matches.MatchID, Tourney_Matches.Lanes,
OddTeam.TeamName AS OddLaneTeam,
EvenTeam.TeamName AS EvenLaneTeam,
Match_Games.GameNumber AS GameNo, 
Winner.TeamName AS Winner
FROM TOURNAMENTS
INNER JOIN TOURNEY_MATCHES
ON TOURNAMENTS.TourneyID = TOURNEY_MATCHES.TourneyID
INNER JOIN TEAMS AS OddTeam
ON TOURNEY_MATCHES.OddLaneTeamID = OddTeam.TeamID
INNER JOIN TEAMS AS EvenTeam
ON TOURNEY_MATCHES.EvenLaneTeamID = EvenTeam.TeamID
INNER JOIN MATCH_GAMES 
ON MATCH_GAMES.MatchID = TOURNEY_MATCHES.MatchID
INNER JOIN TEAMS AS Winner
ON MATCH_GAMES.WinningTeamID = Winner.TeaMID;

# Same as above,copy pasted from book
SELECT Tournaments.TourneyID AS Tourney,
Tournaments.TourneyLocation AS Location,
Tourney_Matches.MatchID, Tourney_Matches.Lanes,
OddTeam.TeamName AS OddLaneTeam,
EvenTeam.TeamName AS EvenLaneTeam,
Match_Games.GameNumber AS GameNo, Winner.TeamName AS
Winner
FROM Tournaments
INNER JOIN Tourney_Matches
ON Tournaments.TourneyID
= Tourney_Matches.TourneyID
INNER JOIN Teams AS OddTeam
ON OddTeam.TeamID
= Tourney_Matches.OddLaneTeamID
INNER JOIN Teams AS EvenTeam
ON EvenTeam.TeamID
= Tourney_Matches.EvenLaneTeamID
INNER JOIN Match_Games
ON Match_Games.MatchID
= Tourney_Matches.MatchID
INNER JOIN Teams AS Winner
ON Winner.TeamID
= Match_Games.WinningTeamID;

# Number of bowlers managed by each captain
SELECT Teams.TeamID, CaptainID, BowlerFirstName, BowlerLastName, count(BowlerID)
FROM Bowlers
JOIN Teams
ON Teams.TeamID = Bowlers.TeamID
GROUP BY Bowlers.TeamID;

#	“List the ID numbers of the teams that won one or more of the first ten matches in Game 3.”
SELECT WinningTeamID, MatchID, GameNumber
FROM Match_Games
WHERE GameNumber = 3 AND MatchID BETWEEN 1 AND 10;

#	“List the bowlers in teams 3, 4, and 5 whose last names begin with the letter ‘H’.”
SELECT BowlerFirstName, BowlerLastName, TeamID
FROM Bowlers
WHERE TeamID IN (3,4,5) 
AND BowlerLastName LIKE 'H%';

# “What was the point spread between a bowler’s handicap and raw score for each match and game played?”
SELECT BowlerID, MatchID, GameNumber,
HandiCapScore - RawScore AS PointDifference
FROM Bowler_Scores
ORDER BY BowlerID, MatchID, GameNumber;

# “Show next year’s tournament date for each tournament location.”
SELECT TourneyLocation
FROM Tournaments;
