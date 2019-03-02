-- question #1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no ASC;

-- question #2
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

-- question #3
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no,
	employees.last_name, employees.first_name, employees.hire_date, dept_manager.to_date
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no

-- question #4
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no ASC;

-- question #5
SELECT * FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- question #6
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no IN
(
	SELECT emp_no FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no FROM departments
		WHERE dept_name='Sales'
	)
);

-- question #7
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no IN
(
	SELECT emp_no FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no FROM departments
		WHERE dept_name='Sales' OR dept_name='Development'
	)
);

-- question #8
SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY "last_name_count" DESC;