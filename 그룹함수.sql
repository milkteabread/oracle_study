--그룹함수

--sum 함수
SELECT SUM(DISTINCT salary),SUM(ALL salary), SUM(salary)
FROM employees;

--avg 함수, max-min 함수
SELECT SUM(salary), trunc(AVG(salary)), trunc(AVG(DISTINCT salary)), MAX(salary), MIN(salary)
FROM employees;

SELECT MIN( hire_date ), MAX( hire_date)
FROM employees;

--count 함수
SELECT COUNT(last_name), COUNT(commission_pct), count(*)
FROM employees;

SELECT SUM(salary), trunc(AVG(salary)), MAX(salary), MIN(salary), count(*)
FROM employees;

--명시적 그룹핑 - 부서번호
select department_id, max(salary), min(salary), sum(salary), trunc(avg(salary)),count(*)
from employees
group by department_id
order by 1;

SELECT SUM(salary)
FROM employees;

--where 절에는 그룹함수 사용불가
SELECT department_id as id, SUM(salary)
FROM employees
--where SUM(salary) > 30000
group by department_id
having SUM(salary) > 30000;
