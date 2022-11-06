--matchup table
CREATE TABLE `matchup` (
  `MatchID` INT NOT NULL AUTO_INCREMENT,
  `MatchCatagory` VARCHAR(10) NOT NULL,
  `teamA` INT NOT NULL,
  `ScoreTeamA` INT,
  `teamB` INT NOT NULL,
  `ScoreTeamB` INT,
  `Refree` INT NOT NULL,
  `MatchDate` DATE NOT NULL,
  `StageID` INT NOT NULL,
  `Winner` INT,
  PRIMARY KEY (`MatchID`),
  CONSTRAINT `FK_refree`
    FOREIGN KEY (`Refree`)
    REFERENCES `staff` (`StaffID`)
    ON UPDATE CASCADE,
  CONSTRAINT `FK_StageIDMatch`
    FOREIGN KEY (`StageID`)
    REFERENCES `stage` (`StageID`),
  CONSTRAINT `FK_teama`
    FOREIGN KEY (`teamA`)
    REFERENCES `team` (`TeamID`)
    ON UPDATE CASCADE,
  CONSTRAINT `FK_teamb`
    FOREIGN KEY (`teamB`)
    REFERENCES `team` (`TeamID`)
    ON UPDATE CASCADE,
  CONSTRAINT `FK_winner`
    FOREIGN KEY (`Winner`)
    REFERENCES `team` (`TeamID`)
    ON UPDATE CASCADE);
--attendee table 
CREATE TABLE `attendee` (
  `AttendeeID` INT NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(20) NOT NULL,
  `MiddleName` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(20) NOT NULL,
  `DOB` DATE NOT NULL,
  `TicketType` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(25) NOT NULL,
  `StageID` INT NOT NULL,
  PRIMARY KEY (`AttendeeID`),
  CONSTRAINT `FK_StageIDAttende`
    FOREIGN KEY (`StageID`)
    REFERENCES `stage` (`StageID`)
    ON UPDATE CASCADE);
--staff table
CREATE TABLE `staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(20) NOT NULL,
  `DOB` DATE NOT NULL,
  `Role` VARCHAR(20) NOT NULL,
  `CountryCode` INT NOT NULL,
  `contactNo` INT NOT NULL,
  `salary` INT NOT NULL,
  PRIMARY KEY (`StaffID`));
--stage table
CREATE TABLE `stage` (
  `StageID` INT NOT NULL AUTO_INCREMENT,
  `capacity` INT,
  `StageNo` INT NOT NULL,
  `stadiumName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`StageID`));
--stats table
CREATE TABLE `stats` (
  `StatsID` INT NOT NULL AUTO_INCREMENT,
  `KDR` FLOAT NOT NULL,
  `TeamMembID` INT NOT NULL,
  `MatchID` INT NOT NULL,
  PRIMARY KEY (`StatsID`),
  CONSTRAINT `FK_MatchIDstat`
    FOREIGN KEY (`MatchID`)
    REFERENCES `matchup` (`MatchID`)
    ON UPDATE CASCADE,
  CONSTRAINT `FK_playerIDStat`
    FOREIGN KEY (`TeamMembID`)
    REFERENCES `team_member` (`teamMembID`)
    ON UPDATE CASCADE);
--team table
CREATE TABLE `team` (
  `TeamID` INT NOT NULL AUTO_INCREMENT,
  `TeamName` VARCHAR(20) NOT NULL,
  `Coach` VARCHAR(10) NOT NULL,
  `RecentAchivement` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`TeamID`));
--team_member
CREATE TABLE `team_member` (
  `teamMembID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(10),
  `InGameName` VARCHAR(20),
  `lastName` VARCHAR(10),
  `DOB` DATE NOT NULL,
  `Role` VARCHAR(20) NOT NULL,
  `TeamID` INT NOT NULL,
  PRIMARY KEY (`teamMembID`),
  CONSTRAINT `FK_TeamIDMembers`
    FOREIGN KEY (`TeamID`)
    REFERENCES `team` (`TeamID`)
    ON UPDATE CASCADE);