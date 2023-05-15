-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Teams" (
    "TeamID" INT   NOT NULL,
    "TeamName" VARCHAR(255)   NOT NULL,
    "FoundedDate" DATE   NOT NULL,
    "HomeCity" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Players" (
    "PlayerID" INT   NOT NULL,
    "FirstName" VARCHAR(255)   NOT NULL,
    "LastName" VARCHAR(255)   NOT NULL,
    "DOB" DATE   NOT NULL,
    "TeamID" INT   NOT NULL
);

CREATE TABLE "Matches" (
    "MatchID" INT   NOT NULL,
    "HomeTeamID" INT   NOT NULL,
    "AwayTeamID" INT   NOT NULL,
    "MatchDate" DATE   NOT NULL,
    "RefereeID" INT   NOT NULL
);

CREATE TABLE "Goals" (
    "GoalID" INT   NOT NULL,
    "PlayerID" INT   NOT NULL,
    "MatchID" INT   NOT NULL,
    "GoalTime" TIME   NOT NULL
);

CREATE TABLE "Referees" (
    "RefereeID" INT   NOT NULL,
    "FirstName" VARCHAR(255)   NOT NULL,
    "LastName" VARCHAR(255)   NOT NULL,
    "ExperienceYears" INT   NOT NULL
);

CREATE TABLE "Seasons" (
    "SeasonID" INT   NOT NULL,
    "StartDate" DATE   NOT NULL,
    "EndDate" DATE   NOT NULL
);

CREATE TABLE "SeasonMatches" (
    "SeasonID" INT   NOT NULL,
    "MatchID" INT   NOT NULL
);

CREATE TABLE "TeamSeasons" (
    "TeamID" INT   NOT NULL,
    "SeasonID" INT   NOT NULL,
    "Points" INT   NOT NULL
);

ALTER TABLE "Teams" ADD CONSTRAINT "fk_Teams_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Players" ("TeamID");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_PlayerID" FOREIGN KEY("PlayerID")
REFERENCES "Goals" ("PlayerID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_MatchID" FOREIGN KEY("MatchID")
REFERENCES "Goals" ("MatchID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_RefereeID" FOREIGN KEY("RefereeID")
REFERENCES "Referees" ("RefereeID");

ALTER TABLE "Seasons" ADD CONSTRAINT "fk_Seasons_SeasonID" FOREIGN KEY("SeasonID")
REFERENCES "TeamSeasons" ("SeasonID");

ALTER TABLE "SeasonMatches" ADD CONSTRAINT "fk_SeasonMatches_SeasonID" FOREIGN KEY("SeasonID")
REFERENCES "Seasons" ("SeasonID");

ALTER TABLE "SeasonMatches" ADD CONSTRAINT "fk_SeasonMatches_MatchID" FOREIGN KEY("MatchID")
REFERENCES "Matches" ("MatchID");

ALTER TABLE "TeamSeasons" ADD CONSTRAINT "fk_TeamSeasons_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Teams" ("TeamID");

