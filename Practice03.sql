-- 문제 1
SELECT emp.employee_id,
emp.first_name,
emp.last_name, 
dept.department_name
FROM employees emp, departments dept 
WHERE emp.department_id = dept.department_id -- 조인 조건
ORDER BY department_name ASC,
employee_id DESC;

-- ANSI
-- JOIN의 의도를 명확하게 하고, 조인 조건과 SELECTION 조건을 분리하는 효과
SELECT emp.employee_id,
emp.first_name,
emp.last_name,
dept.department_name
FROM employees emp JOIN departments dept
ON emp.department_id = dept.department_id -- 조인 조건
ORDER BY department_name ASC,
employee_id DESC;

-- 문제 2
SELECT emp.employee_id,
emp.first_name,
emp.salary,
dept.department_name,
jobs.job_title
FROM employees emp, departments dept, jobs jobs
WHERE emp.job_id = jobs.job_id AND 
emp.department_id = dept.department_id
ORDER BY emp.employee_id ASC;

--ANSI JOIN
SELECT emp.employee_id,
emp.first_name,
emp.salary,
dept.department_name,
jobs.job_title
FROM employees emp JOIN departments dept
ON emp.department_id = dept.department_id -- emp 테이블과 dept 테이블의 JOIN 조건
JOIN jobs jobs
ON emp.job_id = jobs.job_id
ORDER BY emp.employee_id ASC;

-- 문제 2-1
SELECT emp.employee_id,
emp.first_name,
emp.salary,
dept.department_name,
jobs.job_title
FROM employees emp, departments dept, jobs jobs
WHERE emp.job_id = jobs.job_id AND 
emp.department_id = dept.department_id (+) --NULL이 포함된 테이블 쪽이 (+)
ORDER BY emp.employee_id ASC;

-- ANSI JOIN
SELECT emp.employee_id,
emp.first_name,
emp.salary,
dept.department_name,
jobs.job_title
FROM employees emp LEFT OUTER JOIN departments dept
ON emp.department_id = dept.department_id -- emp 테이블과 dept 테이블의 JOIN 조건
JOIN jobs jobs
ON emp.job_id = jobs.job_id
ORDER BY emp.employee_id ASC;

-- 문제 3
SELECT loc.location_id, 
loc.city, 
dept.department_id, 
dept.department_name
FROM locations loc JOIN departments dept
ON loc.location_id = dept.location_id
ORDER BY dept.location_id ASC;

-- 문제 3-1
SELECT loc.location_id, 
loc.city, 
dept.department_id, 
dept.department_name
FROM locations loc LEFT OUTER JOIN departments dept
ON loc.location_id = dept.location_id
ORDER BY dept.location_id ASC;

-- 문제 4
SELECT cont.country_name,
reg.region_name
FROM countries cont JOIN regions reg
ON cont.region_id = reg.region_id
ORDER BY reg.region_name ASC,
cont.country_name DESC;

-- 문제 5
-- SELF JOIN
SELECT emp.hire_date,
emp.employee_id,
emp.first_name,
man.first_name,
man.hire_date
FROM employees emp JOIN employees man
ON emp.manager_id = man.employee_id -- JOIN 조건
WHERE emp.hire_date < man.hire_date; -- SELECTION 조건

-- 문제 6
SELECT cont.country_name,
cont.country_id,
loc.city, 
loc.location_id,
dept.department_name,
dept.department_id
FROM locations loc, countries cont, departments dept
WHERE loc.location_id = dept.location_id AND
loc.country_id = cont.country_id
ORDER BY cont.country_name ASC;

-- 문제 7
SELECT emp.employee_id, 
emp.first_name || ' ' || last_name 이름,
jh.job_id,
jh.start_date,
jh.end_date
FROM employees emp, job_history jh
WHERE emp.employee_id = jh.employee_id AND
jh.job_id = 'AC_ACCOUNT';

-- 문제 8
SELECT dept.department_id, 
dept.department_name,
man.first_name,
loc.city,
cont.country_name,
reg.region_name
FROM departments dept 
JOIN employees man ON dept.manager_id = man.employee_id
JOIN locations loc ON dept.location_id = loc.location_id
JOIN countries cont ON loc.country_id = cont.country_id
JOIN regions reg ON cont.region_id = reg.region_id
ORDER BY dept.department_id;

-- 문제 9
SELECT emp.employee_id,
emp.first_name,
dept.department_name,
man.first_name
FROM employees emp
LEFT OUTER JOIN departments dept
ON emp.department_id = dept.department_id
JOIN employees man
ON emp.manager_id = man.employee_id;


