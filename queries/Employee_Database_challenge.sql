--Retirement titles
select 
	ri.emp_no, 
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date, 
	e.birth_date
into retirement_titles
from retirement_info ri
join titles ti on ri.emp_no = ti.emp_no
join employees e on e.emp_no = ri.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
order by ri.emp_no, ti.from_date

--Retirement Unique Titles
SELECT DISTINCT ON (ri.emp_no) 
					ri.emp_no,
					e.first_name, 
					e.last_name, 
					ti.title
INTO unique_titles
from retirement_info ri
join titles ti on ri.emp_no = ti.emp_no
join employees e on e.emp_no = ri.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
and TI.TO_DATE = '9999-01-01'
order by ri.emp_no, ti.to_date desc

--Retiring_titles
select 
	count(emp_no), title 
into retiring_titles
from unique_titles
group by title
order by count(emp_no) desc