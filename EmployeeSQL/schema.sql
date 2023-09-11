create table titles(
	title_id varchar(5) primary key,
	title varchar(30) not null
	);

create table employees(
	emp_no int primary key, 
	emp_title_id varchar(5) not null,
	foreign key (emp_title_id) references titles (title_id),
	birth_date date not null,
	first_name varchar(33) not null, 
	last_name varchar(33) not null,
	sex char(1) not null, 
	hire_date date not null 
	);
	
create table departments(
	dept_no varchar(5) primary key,
	dept_name varchar(50) not null
	);

create table dept_emp (
	emp_no int not null, 
	foreign key (emp_no) references employees (emp_no),
	dept_no varchar(5) not null,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no, dept_no)
	);

create table dept_manager(
	dept_no varchar(5) not null,
	foreign key(dept_no) references departments (dept_no), 
	emp_no int not null, 
	foreign key (emp_no) references employees (emp_no), 
	primary key (dept_no, emp_no)
	);

CREATE TABLE salaries(
	emp_no int primary key,
	foreign key (emp_no) references employees (emp_no),
	salary int not null
	);