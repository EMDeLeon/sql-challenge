--Table Names: 
-----departments: dept_no  , dept_name
-----dept_emp : emp_no , dept_no , from_date.  , to_date
-----dept_manager:  dept_no   emp_no   from_date  , to_date
-----employees : emp_no   , birth_date , first_name  , last_name  , gender  , hire_date
----- salaries:  emp_no  , salary  , from_date  , to_date
----- titles : emp_no  , title , from_date  , to_date

-----***CREATED THE TABLES via QBD export & UPLOADED the CSVs****-------

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

/*DROP TABLE departments CASCADE;
DROP TABLE dept_emp CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE titles CASCADE;


CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" VARCHAR   NOT NULL,
    "dept_no" VARCHAR  NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" VARCHAR   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" VARCHAR   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" VARCHAR   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "emp_no" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
--REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");*/


------********Specific Tasks Executed******-------------------------------------------



--1.)List the following details of each employee: employee number, last name, first name, gender, and salary.
-- Join into a single QUERY 
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e 
JOIN salaries s 
ON (e.emp_no = s.emp_no);

--2.)List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3.)List the manager of each department with the following information: 
-----dept_no, dept_name, emp_no, last_name, first_name, hire_date, from_date  , to_date
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, dm.from_date, dm.to_date
FROM departments AS d
JOIN dept_manager AS dm
  ON d.dept_no = dm.dept_no
JOIN employees AS e
  ON dm.emp_no = e.emp_no
 WHERE dm.to_date = '9999-01-01';
  
  
--4.)List the department of each employee with the following information: employee number, last name, first name, and department name.
----emp_no, last_name, first_name, dept_name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  WHERE de.to_date = '9999-01-01';

---5.)List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name  FROM employees WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--6.)List all employees in the Sales department, including their employee number, last name, first name, and department name.
--emp_no, last_name, first_name, dept_name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  WHERE d.dept_name = 'Sales';
 
--7.)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  WHERE d.dept_name = 'Sales' OR d.dept_name= 'Development';
 
--8.)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
 
 SELECT last_name, count(last_name) FROM employees
 GROUP BY last_name
 ORDER BY count(last_name), Last_name;

















