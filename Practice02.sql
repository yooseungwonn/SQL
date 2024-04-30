-- 문제 1
SELECT count(manager_id) haveMngCnt 
FROM employees;

-- 문제 2
SELECT MAX(salary) 최고임금, MIN(salary) 최저임금, MAX(salary)-MIN(salary) "최고임금 - 최저임금"
FROM employees;

-- 문제 3
SELECT TO_CHAR(MAX(hire_date), 'YYYY"년" MM"월" DD"일"') 신입사원등록
FROM employees;

-- 문제 4
SELECT department_id, AVG(salary),
MAX(salary), MIN(salary)
FROM employees 
GROUP by department_id
ORDER BY department_id DESC;

-- 문제 5
SELECT job_id, ROUND(AVG(salary)),
MAX(salary), MIN(salary)
FROM employees 
GROUP by job_id
ORDER BY MIN(salary) DESC,
AVG(salary) ASC;

-- 문제 6
SELECT TO_CHAR(MIN(hire_date), 'YYYY-MM-DD DAY') 최연장자
FROM employees;


-- 문제 7
SELECT department_id, AVG(salary),
MIN(salary), AVG(salary)-MIN(salary)
FROM employees
GROUP by department_id
HAVING AVG(salary)-MIN(salary) < 2000 -- 집계 함수 이후의 조건 점검은 HAVING 절에서 해야 한다
ORDER BY AVG(salary)-MIN(salary) DESC;

-- 문제 8
SELECT job_id, MAX(salary),
MIN(salary), MAX(salary)- MIN(salary) diff
FROM employees
GROUP by job_id
ORDER BY diff DESC;

-- 문제 9
SELECT manager_id, ROUND(AVG(salary)),
MIN(salary), MAX(salary) FROM employees
WHERE hire_date >= '15/01/01' -- 집계 함수 실행 이전의 조건 처리
GROUP BY manager_id
HAVING AVG(salary) >= 5000  -- 집계 함수 실행 이후의 조건 처리
ORDER BY AVG(salary) DESC;

-- 문제 10
SELECT first_name, hire_date, employee_id, salary,
CASE WHEN hire_date <= '12/12/31' THEN '창립멤버'
     WHEN hire_date <= '13/12/31' THEN '13년입사'
     WHEN hire_date <= '14/12/31' THEN '14년입사'
     ELSE '상장이후입사'
     END 입사날짜

FROM employees
ORDER By hire_date ASC;


