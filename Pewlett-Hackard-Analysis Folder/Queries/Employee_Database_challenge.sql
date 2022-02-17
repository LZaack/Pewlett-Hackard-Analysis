-- Creating Retirement Titles table 
SELECT 	e.emp_no,
    	e.first_name,
		e.last_name,
    	ti.title,
    	ti.from_date,
    	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (re.emp_no) re.emp_no,
    	re.first_name,
		re.last_name,
    	re.title
INTO unique_titles
FROM retirement_titles as re
WHERE (re.to_date = '9999-01-01')
ORDER BY re.emp_no, re.to_date DESC;

SELECT * FROM unique_titles

-- Number of employees by their most recent job title who are about to retire
SELECT COUNT(u.emp_no), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.title) DESC;

SELECT * FROM retiring_titles

-- Creating Metorship Eligibility table 
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
    d.from_date,
    d.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility

-- Creating Fisrt Retiring Table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
    d.from_date,
    d.to_date,
	ti.title
INTO first_retiring
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1952-12-31')
ORDER BY e.emp_no

SELECT * FROM first_retiring

-- Counting first retiring per title
SELECT COUNT(fu.emp_no), fu.title
INTO first_retiring_titles
FROM first_retiring as fu
GROUP BY fu.title
ORDER BY COUNT(fu.title) DESC;

SELECT * FROM first_retiring_titles

-- Counting mentorshio eligibility per title
SELECT COUNT(me.emp_no), me.title
INTO mentorship_eligibility_per_title
FROM mentorship_eligibility as me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC;

SELECT * FROM mentorship_eligibility_per_title