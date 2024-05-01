-- 문제 1
select count(*) "count(salary)" from employees 
where salary<(select avg(salary) from employees);

-- 문제 2
SELECT emp.employee_id, emp.first_name, emp.salary,
       t.avgSalary, t.maxSalary FROM employees emp
JOIN (SELECT ROUND(AVG(salary)) avgSalary,
             MAX(salary) maxSalary FROM employees) t
ON emp.salary BETWEEN t.avgSalary AND t.maxSalary
ORDER BY salary;

-- 문제 3
SELECT location_id, street_address, postal_code,
city, state_province, country_id FROM locations
WHERE location_id = (SELECT location_id FROM departments
                     WHERE department_id = (SELECT department_id FROM employees
                                            WHERE first_name = 'Steven' AND
                                                  last_name = 'King'));
                                                  
-- JOIN 이용
SELECT location_id, street_address, postal_code,
city, state_province, country_id FROM locations 
NATURAL JOIN departments -- location_id로 JOIN
JOIN employees ON employees.department_id = departments.department_id
WHERE first_name = 'Steven' AND last_name = 'King';

                 
                           
-- 문제 4
select employee_id, first_name, salary
from employees
where salary < ANY (SELECT salary FROM employees
                    WHERE job_id='ST_MAN')
ORDER BY salary DESC; 

-- SELECT salary FROM employees
-- WHERE job_id='ST_MAN';
-- ORDER BY salary DESC;

-- 문제 5
-- 조건절 비교
SELECT emp.employee_id, emp.first_name, emp.salary, emp.department_id FROM employees emp
WHERE (emp.department_id, emp.salary) IN (SELECT department_id, MAX(salary) FROM employees
                                          GROUP BY department_id)
ORDER BY salary DESC;

-- 부서별 최고 급여 쿼리
--SELECT department_id, MAX(salary) FROM employees
--GROUP BY department_id;

-- 테이불 조인
SELECT emp.employee_id, emp.first_name, emp.salary, emp.department_id FROM employees emp
JOIN (SELECT department_id, MAX(salary) salary FROM employees
      GROUP BY department_id) t
ON emp.department_id = t.department_id
WHERE emp.salary = t.salary
ORDER BY emp.salary DESC;


-- 문제 6
SELECT j.job_title, t.sumSalary, j.job_id, t.job_id FROM jobs j
JOIN(SELECT job_id, SUM(salary) sumSalary
     FROM employees GROUP BY job_id) t
ON j.job_id = t.job_id
ORDER BY sumSalary DESC;


-- 문제 7
SELECT emp.employee_id, emp.first_name, emp.salary FROM employees emp
JOIN (SELECT department_id, AVG(salary) salary
      FROM employees GROUP BY department_id) t
ON emp.department_id = t. department_id
WHERE emp.salary > t.salary;
    
                
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

SELECT employee_id, first_name, salary, hire_date FROM
(SELECT rownum RN, employee_id, first_name, salary, hire_date FROM 
(SELECT employee_id, first_name, salary, hire_date FROM employees
ORDER BY hire_date))
WHERE RN >= 11 AND RN <= 15;

SELECT rnum, employee_id, first_name, salary, hire_date
FROM
    (SELECT employee_id, first_name, salary, hire_date,
            ROW_NUMBER() OVER (ORDER BY hire_date) AS rnum
    FROM employees)
WHERE rnum >= 11 AND rnum <= 15;

SELECT rank, employee_id, first_name, salary, hire_date
FROM (SELECT employee_id, first_name, salary, hire_date,
        RANK() OVER (ORDER BY hire_date ASC) AS rank
        FROM employees) 
WHERE rank BETWEEN 11 AND 15;       


