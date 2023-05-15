-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Users" (
    "UserID" INT   NOT NULL,
    "UserName" VARCHAR(255)   NOT NULL,
    "PreferredRegionID" INT   NOT NULL
);

CREATE TABLE "Regions" (
    "RegionID" INT   NOT NULL,
    "RegioinName" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Posts" (
    "PostID" INT   NOT NULL,
    "UserID" INT   NOT NULL,
    "Title" VARCHAr(255)   NOT NULL,
    "Text" TEXT   NOT NULL,
    "PostLocation" VARCHAR(255)   NOT NULL,
    "RegionID" INT   NOT NULL,
    "PostDate" DATE   NOT NULL
);

CREATE TABLE "Categories" (
    "CategoryID" INT   NOT NULL,
    "CategoryName" VARCHAR(255)   NOT NULL
);

CREATE TABLE "PostCategories" (
    "PostID" INT   NOT NULL,
    "CategoryID" INT   NOT NULL
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_UserID" FOREIGN KEY("UserID")
REFERENCES "Posts" ("UserID");

ALTER TABLE "Regions" ADD CONSTRAINT "fk_Regions_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Posts" ("RegionID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_PostID" FOREIGN KEY("PostID")
REFERENCES "PostCategories" ("PostID");

ALTER TABLE "Categories" ADD CONSTRAINT "fk_Categories_CategoryID" FOREIGN KEY("CategoryID")
REFERENCES "PostCategories" ("CategoryID");

