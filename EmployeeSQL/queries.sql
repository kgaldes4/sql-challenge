-- salaries
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
	join 
	salaries
		on employees.emp_no = salaries.emp_no;

-- 1986
select employees.first_name, employees.last_name, employees.hire_date
from employees
where extract(year from employees.hire_date) = 1986;

-- managers
select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from dept_manager
	join 
	employees
		on employees.emp_no = dept_manager.emp_no
			join 
			departments
				on dept_manager.dept_no = departments.dept_no;
-- departments
select departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from departments
	join 
	dept_emp
		on departments.dept_no = dept_emp.dept_no 
			join 
			employees
				on dept_emp.emp_no = employees.emp_no;

-- herky B
select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules' 
	and last_name like 'B%';
	
--sales department
select employees.emp_no, employees.last_name, employees.first_name
from employees
where employees.emp_no in
	(select dept_emp.emp_no 
	 from dept_emp
	 where dept_emp.dept_no = 
		(select departments.dept_no
		 from departments
		 where departments.dept_name = 'Sales'));
		 
-- sales and dev
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
	join
	dept_emp
		on employees.emp_no = dept_emp.emp_no 
			join 
			departments 
				on dept_emp.dept_no = departments.dept_no 
				where departments.dept_name = 'Sales' 
					or departments.dept_name = 'Development';

-- last names
select employees.last_name, count(employees.last_name) as last_name_count
from employees
group by employees.last_name
order by last_name_count desc;
