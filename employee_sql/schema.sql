-- Create tables to import .csv files into

-- This table has a Primary Key and is created first, before other tables that reference it
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY
	,dept_name VARCHAR NOT NULL
);

-- This table has a Primary Key and is created before other tables that reference it
CREATE TABLE titles (
	title_id VARCHAR(5) NOT NULL PRIMARY KEY
	,title VARCHAR NOT NULL
);

-- This table has a Primary Key and is created before other tables that reference it
CREATE TABLE employees (
	emp_no VARCHAR(6) NOT NULL PRIMARY KEY
	,emp_title VARCHAR(5) REFERENCES titles(title_id) NOT NULL
	,birth_date DATE
	,first_name VARCHAR  NOT NULL
	,last_name VARCHAR NOT NULL
	,sex VARCHAR(1)
	,hire_date DATE NOT NULL
);

-- This table has Foreign Keys that reference the departments and employees tables
CREATE TABLE dept_emp (
	emp_no VARCHAR(6) NOT NULL REFERENCES employees(emp_no)
	,dept_no VARCHAR(4) NOT NULL REFERENCES departments(dept_no)
	,PRIMARY KEY (emp_no, dept_no)
);

-- This table has Foreign Keys that reference the departments and employees tables
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL REFERENCES departments(dept_no)
	,emp_no VARCHAR(6) NOT NULL REFERENCES employees(emp_no)
	,PRIMARY KEY (dept_no, emp_no)
);

-- This table has a Foreign Key that references the employees table
CREATE TABLE salaries (
	emp_no VARCHAR(6) NOT NULL REFERENCES employees(emp_no)
	,salary INT NOT NULL
	,PRIMARY KEY (emp_no, salary)
);

