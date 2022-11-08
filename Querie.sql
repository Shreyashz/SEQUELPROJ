--Displays total no of teams, total no of staff, total no of players, & total no of attendees
SELECT count(DISTINCT t.teamID) as total_teams, count(DISTINCT s.staffID) as total_staff, count(DISTINCT tm.teamMembID) as total_players, count(DISTINCT a.attendeeID) as total_attendees FROM team as t, staff as s, team_member as tm, attendee as a;
--Displays team's name and it's score per matchup
SELECT A.TEAMNAME AS TEAM_A, C.ScoreTeamA TeamA_Score, B.TEAMNAME AS TEAM_B, C.ScoreTeamB TeamB_Score FROM MATCHUP C INNER JOIN TEAM A ON teama=teamid, matchup D INNER JOIN team B ON  teamb=teamid WHERE C.MATCHID=D.MATCHID='1' AND C.MATCHID !=0 ORDER BY C.MATCHID;
--Displays Fist Name, Salary and Role who has got maximum salary
SELECT S.FNAME, S.Salary, S.Role FROM staff S WHERE s.salary=(select max(salary) from staff);
--Displays winner, Stadium name, & Match Date as per matchup
SELECT A.TeamName Winner, S.stadiumName, M.MatchDate FROM Team A inner join Matchup M on M.Winner=A.teamID INNER JOIN Stage S on S.StageID=M.StageID WHERE S.StageID<>0;
--Displays Player, and his name
SELECT b.InGameName as player, a.teamName FROM team a INNER JOIN team_member b on a.teamID=b.teamID ;
--Displays total no of attendees for all the matches 
SELECT sum(a.capacity) TotalAttendees FROM stage A INNER JOIN matchup M ON a.stageID= M.stageID;
--Displays Stadium Name and stage ID if it's capacity is less than 18000
SELECT stadiumName, stageID FROM stage WHERE capacity<18000 AND stageID<>0;
--Displays Role who has second highes paying job
SELECT DISTINCT Role FROM staff where salary=(SELECT min(salary) FROM staff where salary <>(SELECT max(salary) from staff));