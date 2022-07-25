-- Q1
SHOW TABLES;

-- Q2
SELECT first_name, last_name, gender
FROM employees;

-- Q3
SELECT title
FROM titles;

-- Q4
SELECT DISTINCT(title)
FROM titles;

-- Q5
SELECT COUNT(emp_no)
FROM employees;

-- Q6
SELECT COUNT(*)
FROM salaries;

-- Q7
SELECT COUNT(DISTINCT(dept_name))
FROM departments;

-- Q8
SELECT DISTINCT(dept_name)
FROM departments;

-- Q9
SELECT last_name, first_name
FROM employees
Where gender = "F";

-- Q10
SELECT COUNT(*)
FROM employees
WHERE gender = "M";

-- Q11
SELECT first_name, last_name 
FROM employees 
WHERE hire_date < "1990-01-01";

-- Q12
SELECT first_name, last_name, gender, hire_date
FROM employees 
WHERE hire_date >= "1995-01-01" AND gender = "M";

-- Q13
SELECT COUNT(first_name) 
FROM employees 
WHERE first_name IN ("Adin", "Deniz", "Youssef", "Roded");

-- Q14 a
-- To see what titles are there first:
SELECT distinct(title)
FROM titles;

-- Finding out how many engineers:
SELECT COUNT(title) AS Number_of_Engineers
FROM titles
WHERE title LIKE "%engineer%";

-- Q14 b
SELECT COUNT(title)
FROM titles
WHERE title NOT LIKE "%Engineer%";

-- Q15
SELECT COUNT(emp_no) 
FROM employees
WHERE "1990-01-01" <= hire_date AND hire_date <= "1994-01-01";

-- Q16
SELECT DISTINCT(last_name)
FROM employees
WHERE gender = "F" 
AND birth_date < "1970-01-01" 
AND hire_date >= "1996-01-01"
ORDER BY last_name;

-- Q17
SELECT gender, COUNT(gender)
FROM employees
WHERE hire_date < "1989-01-01"
GROUP BY gender;

-- Q18 a 
SELECT dept_name, COUNT(emp_no) AS Number_of_employees, gender
FROM dept_emp
	INNER JOIN departments 
		USING(dept_no)
	INNER JOIN employees
		USING(emp_no)
GROUP BY dept_name, Gender
ORDER BY gender;

-- Q18 b
SELECT gender, COUNT(emp_no)
FROM employees
WHERE "1994-01-01" <= hire_date AND hire_date < "1997-01-01"
GROUP BY gender;

-- Q19
SELECT first_name, last_name
FROM employees
	INNER JOIN dept_emp
		USING(emp_no)
WHERE dept_no in (
SELECT dept_no
FROM dept_manager
WHERE from_date = "1992-09-08" AND to_date = "1996-01-03"
);

SELECT first_name, last_name 
FROM employees 
	INNER JOIN dept_emp 
		USING (emp_no) 
	INNER JOIN departments 
		USING(dept_no) 
WHERE from_date >= '1992-09-08' AND to_date <= '1996-01-03';

-- Q20
SELECT first_name, last_name, title FROM employees INNER JOIN titles USING(emp_no);

-- Q21
SELECT dept_name, FORMAT (AVG(salary), 2) AS Average_salary
FROM dept_emp
	INNER JOIN departments
		USING(dept_no)
	INNER JOIN salaries
		USING(emp_no)
GROUP BY dept_name;

-- Q22
SELECT dept_name, FORMAT (AVG(salary), 2) AS Average_salary, COUNT(emp_no) AS Number_of_employees
FROM dept_emp
	INNER JOIN departments
		USING(dept_no)
	INNER JOIN salaries
		USING(emp_no)
        
GROUP BY dept_name;

-- Q23
SELECT dept_name, COUNT(emp_no) AS Number_of_employees
FROM salaries
	INNER JOIN dept_emp
		USING(emp_no)
	INNER JOIN departments
		USING(dept_no)
WHERE salary > 130000
GROUP BY dept_name;