-- 문제 1
select count(*) countsalary from employees 
where salary<(select avg(salary) from employees);


