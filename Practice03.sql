-- 문제 1
SELECT employee_id,
first_name,
last_name, 
emp.department_id,
dept.department_id,
department_name
FROM employees emp, departments dept 
WHERE emp.department_id = dept.department_id
ORDER BY department_name ASC,
employee_id DESC;

-- 문제 2

-- 문제 3
SELECT loc.location_id, dept.location_id, city, department_id, department_name
FROM locations loc, departments dept
WHERE loc.location_id = dept.location_id
ORDER BY dept.location_id ASC;




