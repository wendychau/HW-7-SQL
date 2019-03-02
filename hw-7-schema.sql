-- schemas
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE "departments" (
    "dept_no" VARCHAR,
    "dept_name" VARCHAR,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER,
    "dept_no" VARCHAR,
    "from_date" VARCHAR,
    "to_date" VARCHAR
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR,
    "emp_no" INTEGER,
    "from_date" VARCHAR,
    "to_date" VARCHAR
);

CREATE TABLE "employees" (
    "emp_no" INTEGER,
    "birth_date" VARCHAR,
    "first_name" VARCHAR,
    "last_name" VARCHAR,
    "gender" VARCHAR,
    "hire_date" VARCHAR,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER,
    "salary" INTEGER,
    "from_date" VARCHAR,
    "to_date" VARCHAR
);

CREATE TABLE "titles" (
    "emp_no" INTEGER,
    "title" VARCHAR,
    "from_date" VARCHAR,
    "to_date" VARCHAR
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");