-- 문제 1
SELECT count(*)-1 haveMngCnt 
FROM employees;

-- 문제 2
SELECT MAX(salary)-MIN(salary) 차액
FROM employees;

-- 문제 3
SELECT TO_CHAR(MAX(hire_date), 'YYYY"년"MM"월"DD"일"') 신입사원등록
FROM employees;


-- 문제 4
SELECT department_id, AVG(salary),
MAX(salary), MIN(salary)
FROM employees 
GROUP by department_id
ORDER BY department_id DESC;

-- 문제 5
SELECT job_id, ROUND(AVG(salary), 2),
MAX(salary), MIN(salary)
FROM employees 
GROUP by job_id
ORDER BY MIN(salary) DESC,
AVG(salary) ASC;

-- 문제 6
SELECT TO_CHAR(MIN(hire_date), 'YYYY-MM-DD DAY') 최연장자
FROM employees;


-- 문제 7
SELECT department_id,  ROUND(AVG(salary), 2),
MIN(salary), AVG(salary)-MIN(salary)
FROM employees
GROUP by department_id
ORDER BY ROUND(AVG(salary)-MIN(salary), 2) DESC;

-- 문제 8
SELECT job_id, MIN(salary),
MAX(salary), MAX(salary)- MIN(salary)
FROM employees
GROUP by job_id
ORDER BY MAX(salary)- MIN(salary) DESC;

-- 문제 9
SELECT manager_id, ROUND(AVG(salary), 1),
MAX(salary), MIN(salary), hire_date
FROM employees group by manager_id, hire_date
WHERE (AVG(salary) >= '5000') AND
(hire_date >= '15/01/01');

-- 문제 10
SELECT first_name, hire_date,
CASE WHEN hire_date <= '12/12/31' THEN '창립멤버'
     WHEN hire_date <= '13/12/31' THEN '13년입사'
     WHEN hire_date <= '14/12/31' THEN '14년입사'
     ELSE '상장이후입사'
     END 입사날짜

FROM employees
ORDER By hire_date ASC;


