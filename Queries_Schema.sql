-- 1. List the following details of each employee: employee number, last name, first name, gender and salary
select * from employees; -- to see column names 

select employees.emp_no, employees.last_name, employees.first_name, 
		employees.sex, salaries.salary 
from employees
left join salaries
on employees.emp_no = salaries.emp_no
order by emp_no

-- 2. List employees hired in 1986

select * from employees
where date_part('year', hire_date) = 1986
order by emp_no;

-- 3. List manager of each department with department number and 
-- name and employee number, first and last name

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no,
		employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no;

-- 4. List department number for each employee along with employee's 
-- employee number, first and last name, and department name

select employees.emp_no, employees.last_name, employees.first_name,
		dept_emp.dept_no, departments.dept_name
from employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on departments.dept_no=dept_emp.dept_no
order by emp_no;

-- 5. List first and last name and gender of each employee with 
-- first name Hercules and last name B.

select * from employees
where first_name = 'Hercules' AND last_name like 'B%';

-- 6. List each employee in the Sales department including 
-- employee number, first and last name

select employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
from employees
left join dept_emp
on employees.emp_no=dept_emp.emp_no
inner join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_name='Sales';

-- 7. List each employee in Sales and Development departments 
-- including employee number, first and last name and department name

select employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
from employees 
left join dept_emp
on employees.emp_no=dept_emp.emp_no
inner join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_name in ('Sales', 'Development')
order by emp_no;

-- 8. List frequency counts in descending order of all employee 
-- last names (how many employees share each last name)

select last_name, count(*) as freq_count
from employees 
group by last_name
order by freq_count desc;