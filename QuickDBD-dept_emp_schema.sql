-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GjrX8D
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "DEPTS" (
    "DEPT_NO" int   NOT NULL,
    "DEPT_NAME" string   NOT NULL,
    CONSTRAINT "pk_DEPTS" PRIMARY KEY (
        "DEPT_NO"
     )
);

CREATE TABLE "DEPT_EMP" (
    "DEPT_NO" int   NOT NULL,
    "EMP_NO" int   NOT NULL,
    CONSTRAINT "pk_DEPT_EMP" PRIMARY KEY (
        "DEPT_NO","EMP_NO"
     )
);

CREATE TABLE "DEPT_MGR" (
    "DEPT_NO" int   NOT NULL,
    "EMP_NO" int   NOT NULL,
    CONSTRAINT "pk_DEPT_MGR" PRIMARY KEY (
        "DEPT_NO","EMP_NO"
     )
);

CREATE TABLE "EMPLOYEE" (
    "EMP_NO" int   NOT NULL,
    "EMP_TITLE_ID" string   NOT NULL,
    "BIRTH_DATE" DATE   NOT NULL,
    "FIRST_NAME" string   NOT NULL,
    "LAST_NAME" string   NOT NULL,
    "SEX" string   NOT NULL,
    "HIRE_DATE" date   NOT NULL,
    CONSTRAINT "pk_EMPLOYEE" PRIMARY KEY (
        "EMP_NO"
     )
);

CREATE TABLE "SALARIES" (
    "EMP_NO" int   NOT NULL,
    "SALARY" float   NOT NULL
);

CREATE TABLE "TITLES" (
    "TITLE_ID" string   NOT NULL,
    "TITLE" string   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "TITLE_ID"
     )
);

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_DEPT_NO" FOREIGN KEY("DEPT_NO")
REFERENCES "DEPTS" ("DEPT_NO");

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "EMPLOYEE" ("EMP_NO");

ALTER TABLE "DEPT_MGR" ADD CONSTRAINT "fk_DEPT_MGR_DEPT_NO" FOREIGN KEY("DEPT_NO")
REFERENCES "DEPTS" ("DEPT_NO");

ALTER TABLE "DEPT_MGR" ADD CONSTRAINT "fk_DEPT_MGR_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "EMPLOYEE" ("EMP_NO");

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "fk_EMPLOYEE_EMP_TITLE_ID" FOREIGN KEY("EMP_TITLE_ID")
REFERENCES "TITLES" ("TITLE_ID");

ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "EMPLOYEE" ("EMP_NO");

