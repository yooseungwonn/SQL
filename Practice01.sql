-- 문제 1
SELECT first_name || ' ' || last_name 이름,
salary 월급, phone_number 전화번호,hire_date 입사일
FROM employees
ORDER By hire_date ASC;

-- 문제 2
SELECT job_title, max_salary FROM jobs
ORDER by max_salary DESC;

-- 문제 3
SELECT first_name, manager_id, commission_pct, salary FROM employees
WHERE
manager_id IS NOT NULL AND
commission_pct IS NULL AND
salary > 3000;

-- 문제 4
SELECT job_title, max_salary FROM jobs
WHERE max_salary >=10000
ORDER by max_salary DESC;

-- 문제 5
SELECT first_name, salary,  NVL(commission_pct, 0) FROM employees
WHERE salary >=10000 AND salary <14000
ORDER by salary DESC;

-- 문제 6
SELECT first_name, salary, hire_date, department_id,
TO_CHAR(hire_date, 'YYYY-MM') YYYY_MM
FROM employees
WHERE department_id IN(10, 90, 100);

-- 문제 7
SELECT first_name, salary
FROM employees
WHERE first_name Like '%s%' OR first_name Like '%S%';

-- 문제 8
SELECT department_name FROM departments
ORDER By length(Department_name) DESC;

-- 문제 9
SELECT UPPER(country_name) 나라이름 
FROM countries
ORDER By UPPER(country_name) ASC;
-- 문제 10
SELECT first_name || ' ' || last_name 이름,
salary 월급,
REPLACE(SUBSTR(phone_number, 3), '.', '-') 전화번호,
hire_date 입사일
FROM employees
WHERE hire_date <= '13/12/31';
