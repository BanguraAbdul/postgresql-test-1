-- Q1. Write a PostgreSQL query to create a table called 'employees' with columns for 'id' (integer, Primary key)
--'first_name' (varchar), 'last_name' (varchar), and salary (numeric).
CREATE TABLE employees(
	id INTEGER PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	salary NUMERIC
);

--Q2. Write a query to insert an employee with 'id' 1, 'first_name' 'John', 'last_name' 'Doe', and 'Salary' 50000.00.
INSERT INTO employees(id, first_name, last_name, salary)
VALUES (1, 'John', 'Doe', 50000.00);

--Q3. Write a query to select all columns from the 'employees' table.
SELECT * FROM employees;

--Q4. Write a query to select the 'first_name', 'last_name', and 'salary' of employees whose salary is greater than 60000.
SELECT first_name, last_name, salary FROM employees
WHERE salary>60000;

--Q5. Write a query to update the salary of the employee with 'id' 1 to 55000.00
UPDATE employees SET salary=55000.00 WHERE id=1;

--Q6. Write a query to delete the employee with 'id' 1 from the 'employees' table.
DELETE FROM employees WHERE id=1;

--Q7. Write a query to create a 'departments' table with column 'dept_id' (integer, primary key) and 'dept_name' (varchar), and add a 'dept_id' column to the 'employees' table to reference it.
CREATE TABLE departments(
	dept_id INTEGER PRIMARY KEY,
	dept_name VARCHAR
);
ALTER TABLE employees ADD COLUMN dept_id INTEGER REFERENCES departments(dept_id);

--Q8. Write a query to join the 'employees' and 'departments' tables to show 'first_name', 'last_name' and 'dept_name'.
SELECT first_name, last_name, dept_name FROM employees e
JOIN departments d ON d.dept_id=e.dept_id;

--Q9. write a query to select 'first_name' and 'last_name' of employees where 'dept_id' is NULL.
SELECT first_name, last_name FROM employees WHERE dept_id=NULL;

--Q10. Write a query to group employees by 'dept_id' and count how many are in each department.
SELECT dept_id, COUNT(*) as emp_per_dept FROM employees
GROUP BY dept_id;

--Q11. Write a query to select all columns from 'employees', ordered by 'salary' from highest to lowest.
SELECT * FROM employees ORDER BY salary DESC;

--Q12. Write a query to calculate the average salary across all employees
SELECT first_name, last_name, AVG(salary) FROM employees
GROUP BY first_name, last_name;

--Q13. Write a query to alter the 'employees' table to add a check constraint that 'salary' must be greater than 0.
ALTER TABLE employees ADD CONSTRAINT salary_check CHECK(salary>0);

--Q14. Write a query to select 'first_name' and 'last_name' of employees where 'first_name' beging 'J'.
SELECT first_name, last_name FROM employees WHERE first_name LIKE 'J%';

--Q15. Write a query to create an index on the 'last_name' column of the 'employees' table.
CREATE INDEX last_name_idx ON employees(last_name);


