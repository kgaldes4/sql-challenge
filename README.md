# sql-challenge
mostly used gitlab as a resource for questions. 


syntax for ERD
--

employees
-
emp_no PK int
emp_title_id varchar(5) Fk >- titles.title_id
birth_date date
first_name varchar(33)
last_name varchar(33)
sex varchar(1)
hire_date date

salaries
-
emp_no fk - employees.emp_no  int
salary int

titles
-
title_id pk varchar(5)
title varchar(30)

dept_manager
-
dept_no fk >- departments.dept_no varchar(5)
emp_no fk - employees.emp_no int

dept_emp
-
emp_no fk - employees.emp_no int
dept_no fk >- departments.dept_no varchar(5)

departments
-
dept_no pk varchar(5)
dept_name varchar(50)