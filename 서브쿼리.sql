
--서브쿼리
SELECT salary
FROM employees
WHERE last_name='Whalen'; --4400

SELECT last_name,salary
FROM employees
WHERE salary >= 4400;

--메인쿼리
SELECT last_name,salary
FROM employees
WHERE salary >= (SELECT salary  --서브쿼리
                FROM employees
                WHERE last_name='Whalen');
                
--사원들의 평균월급보다 더 많은 월급을 받는 사원 조회
SELECT avg(salary)
FROM employees;  --6461.83

select *
from employees
where salary >= 6461.83;

select *
from employees
where salary >= (SELECT avg(salary)
                  FROM employees);
                  
--다음은 부서번호가 100인 사원들 중에서 최대 월급을 받는 사원과 동일한 월급을 받는 사원을 조회
select max(salary)
from employees
where DEPARTMENT_ID = 100;  --12008

select *
from employees
where salary = 12008;

select *
from employees
where salary = (select max(salary)
                from employees
                where DEPARTMENT_ID = 100);
                
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > (SELECT MAX(salary)
FROM employees
WHERE department_id=100 );

SELECT salary
FROM employees
WHERE last_name IN ('Whalen','Fay');
 
 SELECT last_name, salary
FROM employees
WHERE salary IN ( SELECT salary
                  FROM employees
                  WHERE last_name IN ('Whalen','Fay') );
                  
--다중연산자 > all : 최대값보다 큰값을 조회
SELECT last_name, department_id, salary
FROM employees
WHERE salary > all (SELECT salary
                FROM employees
                WHERE job_id = 'IT_PROG');
                
--다중연산자 < all : 최소값보다 작은값을 조회(최소 월급보다 작은)
SELECT last_name, department_id, salary
FROM employees
WHERE salary < ALL (SELECT salary
                    FROM employees
                     WHERE job_id = 'IT_PROG');
                     
SELECT last_name, department_id, salary
FROM employees
WHERE salary < (SELECT min(salary)
                    FROM employees
                     WHERE job_id = 'IT_PROG');

--다중연산자 -- > any: 최소값보다 큰 메인쿼리 조회
SELECT last_name, department_id, salary
FROM employees
WHERE salary > ANY (SELECT salary
                   FROM employees
                    WHERE job_id = 'IT_PROG');
                    
 --다중연산자 -- < any: 최대값보다 작은 메인쿼리 조회
SELECT last_name, department_id, salary
FROM employees
WHERE salary < ANY (SELECT salary
                   FROM employees
                    WHERE job_id = 'IT_PROG');
                    
SELECT last_name, department_id, salary
FROM employees
WHERE EXISTS (SELECT employee_id
              FROM employees
              WHERE commission_pct IS NOT NULL);

SELECT last_name, department_id, salary
FROM employees
WHERE EXISTS (SELECT employee_id
              FROM employees
              WHERE salary < -100);

select employee_id
                from EMPLOYEES
                where SALARY < -100;

--다중컬럼 서브쿼리
SELECT last_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN ( SELECT department_id, MAX(salary)
 FROM employees
GROUP BY department_id )
ORDER BY 2;

--인라인 뷰
SELECT e.department_id , SUM(salary) 총합, AVG(salary) 평균, COUNT(*) 인원수
FROM employees e , departments d
WHERE e.department_id = d.department_id
GROUP BY e.department_id
ORDER BY 1;

SELECT e.department_id, 총합, 평균, 인원수
FROM ( SELECT department_id, SUM(salary) 총합, AVG(salary) 평균 ,
 COUNT(*) 인원수 
 FROM employees
 GROUP BY department_id ) e, departments d
WHERE e.department_id = d.department_id
ORDER By 1;