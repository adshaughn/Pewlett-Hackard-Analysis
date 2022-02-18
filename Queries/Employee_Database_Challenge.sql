-- Module 7 challenge

select emp_no,
	first_name,
	last_name
from Employees;

select title,
	from_date,
	to_date
from Titles;

-- build combined retirement titles table for employees
-- born 1952-1955

select e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
into retirement_titles
from titles as t
inner join employees as e on e.emp_no = t.emp_no
where e.birth_date between '1952-01-01' and '1955-12-31'
order by e.emp_no asc;


-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- number of employees who are about to retire by job title

select count(emp_no),
title
into retiring_titles
from unique_titles
group by title
order by count(emp_no) desc;

