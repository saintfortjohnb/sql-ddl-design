-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Doctors" (
    "DoctorID" INT   NOT NULL,
    "FirstName" VARCHAR(255)   NOT NULL,
    "LastName" VARCHAR(255)   NOT NULL,
    "Specialty" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Patients" (
    "PatientID" INT   NOT NULL,
    "FirstName" VARCHAR(255)   NOT NULL,
    "LastName" VARCHAR(255)   NOT NULL,
    "DOB" DATE   NOT NULL,
    "Gender" CHAR(1)   NOT NULL
);

CREATE TABLE "Diseases" (
    "DiseaseID" INT   NOT NULL,
    "DiseaseName" VARCHAR(255)   NOT NULL,
    "Description" TEXT   NOT NULL
);

CREATE TABLE "Visits" (
    "VisitID" INT   NOT NULL,
    "DoctorID" INT   NOT NULL,
    "PatientID" INT   NOT NULL,
    "VisitDate" DATE   NOT NULL
);

CREATE TABLE "Diagnoses" (
    "DiagnoseID" INT   NOT NULL,
    "VisitID" INT   NOT NULL,
    "DiseaseID" INT   NOT NULL
);

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Visits" ("DoctorID");

ALTER TABLE "Patients" ADD CONSTRAINT "fk_Patients_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Visits" ("PatientID");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_VisitID" FOREIGN KEY("VisitID")
REFERENCES "Diagnoses" ("VisitID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Diseases" ("DiseaseID");

