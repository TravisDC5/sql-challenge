
--Checking to see if data imported correctly, and
-- looking for anything needing to be cleaned.
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--Fixing Birth Date Values
UPDATE employees
SET birth_date = birth_date - interval '100 year'
WHERE birth_date > '2020-05-11';

--Checking Birth Date Values
SELECT * FROM employees;

--Question 1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
	JOIN salaries ON employees.emp_no = salaries.emp_no;

--Question 2
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01';

--Question 3
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
	JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
	JOIN employees ON dept_manager.emp_no = employees.emp_no;
	
--Question 4
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
	JOIN employees ON dept_emp.emp_no = employees.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no;
	
--Question 5
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--Question 6
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
	JOIN employees ON dept_emp.emp_no = employees.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--Question 7
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
	JOIN employees ON dept_emp.emp_no = employees.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--Question 8
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

