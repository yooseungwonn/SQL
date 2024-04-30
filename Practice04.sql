-- 문제 1
select count(*) countsalary from employees 
where salary<(select avg(salary) from employees);

-- 문제 2
SELECT employee_id, first_name, salary FROM employees
WHERE salary >= (SELECT AVG(salary) FROM employees) AND
      salary <= (SELECT MAX(salary) FROM employees)
GROUP BY employee_id, first_name, salary
ORDER BY salary ASC;

-- 문제 3
SELECT location_id, street_address, postal_code,
city, state_province, country_id FROM locations,
(SELECT salary FROM employees WHERE first_name = 'Steven');  

                 
                           
-- 문제 4
select first_name, salary, job_id
from employees
where salary < ANY (SELECT salary FROM employees
                    WHERE job_id='ST_MAN')
ORDER BY salary DESC; 


-- 문제 5
SELECT


-- 문제 7
SELECT employee_id, first_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
    
                
-- 문제 8
SELECT rownum RN, employee_id, first_name, salary, hire_date
FROM (SELECT * FROM employees
ORDER BY hire_date ASC)
WHERE rownum <= 15
MINUS
SELECT rownum RN, employee_id, first_name, salary, hire_date
FROM (SELECT * FROM employees
ORDER BY hire_date ASC)
WHERE rownum <= 10
ORDER BY hire_date ASC;




       


