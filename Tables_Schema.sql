drop table departments cascade;
drop table dept_emp cascade;
drop table dept_manager cascade;
drop table employees cascade;
drop table salaries cascade;
drop table titles cascade;

create table departments (dept_no varchar not null, 
						  dept_name varchar not null, 
						  primary key(dept_no));

create table dept_emp (emp_no int not null, dept_no varchar not null, 
					  foreign key(dept_no) references departments(dept_no),
					  foreign key(emp_no) references employees(emp_no));

create table dept_manager (dept_no varchar not null, emp_no int not null,
						  foreign key(dept_no) references departments(dept_no));

create table employees (emp_no int not null, emp_title varchar not null, 
						birth_date date not null, first_name varchar not null, 
						last_name varchar not null, sex varchar(2) not null, 
						hire_date date not null, 
						primary key (emp_no), 
						foreign key(emp_title) references titles(title_id));
						
create table salaries (emp_no int not null, salary int not null,
					  foreign key (emp_no) references employees(emp_no));

create table titles (title_id varchar not null, title varchar not null,
					primary key(title_id));
					
