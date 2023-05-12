-- Query to list the employee number, last name, first name, sex, and salary of each employee
SELECT
	emp.emp_no
	,last_name
	,first_name
	,sex
	,salary
FROM employees AS emp
	LEFT JOIN salaries AS sal
	ON emp.emp_no = sal.emp_no
;

-- Query to list the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	first_name
	,last_name
	,hire_date
FROM employees
WHERE
	DATE_PART('year', hire_date) = 1986
;

/* Query to list the manager of each department along with their department number, department name,
employee number, last name, and first name */
SELECT
	dept_name
	,dep.dept_no
	,mgr.emp_no
	,last_name
	,first_name
FROM departments AS dep
	LEFT JOIN dept_manager AS mgr
	ON mgr.dept_no = dep.dept_no
	INNER JOIN employees AS emp
	ON emp.emp_no = mgr.emp_no
;

/* Query to list the department number for each employee along with that employee’s employee number,
last name, first name, and department name */
SELECT
	last_name
	,first_name
	,emp.emp_no
	,dep.dept_no
	,dept_name
FROM employees AS emp
	LEFT JOIN dept_emp AS dep_e
	ON emp.emp_no = dep_e.emp_no
	INNER JOIN departments AS dep
	ON dep_e.dept_no = dep.dept_no
;

/* Query to list first name, last name, and sex of each employee whose first name is Hercules and
whose last name begins with the letter B */
SELECT
	first_name
	,last_name
	,sex
FROM employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%'
;

/* List each employee in the Sales department, including their employee number, last name, and
first name */
SELECT
	last_name
	,first_name
	,emp.emp_no
FROM employees AS emp
	LEFT JOIN dept_emp AS dep_e
	ON emp.emp_no = dep_e.emp_no
	LEFT JOIN departments AS dep
	ON dep_e.dept_no = dep.dept_no
	WHERE dep.dept_name = 'Sales'
;

/* List each employee in the Sales and Development departments, including their employee number,
last name, first name, and department name */
SELECT
	last_name
	,first_name
	,emp.emp_no
	,dep.dept_name
FROM employees AS emp
	LEFT JOIN dept_emp AS dep_e
	ON emp.emp_no = dep_e.emp_no
	LEFT JOIN departments AS dep
	ON dep_e.dept_no = dep.dept_no
	WHERE dep.dept_name = 'Sales'
	OR dep.dept_name = 'Development'
ORDER BY dep.dept_name
;

-- Query to list the frequency counts, in descending order, of all the employee last names
SELECT
	last_name
	,COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;
