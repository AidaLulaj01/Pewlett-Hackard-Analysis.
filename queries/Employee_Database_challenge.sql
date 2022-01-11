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

-----mentorship_eligibilty
select DISTINCT ON (T.EMP_NO)
		e.emp_no, 
		e.first_name, 
		e.last_name, 
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
Into mentorship_eligibilty
From employees e
join dept_emp de on e.emp_no = de.emp_no
join titles t on e.emp_no = t.emp_no
where t.to_date = '9999-01-01'
and birth_date between '1965-01-01' and '1965-12-31'
order by t.emp_no, t.to_date