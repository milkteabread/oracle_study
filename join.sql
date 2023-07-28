
--제약조건 검색
select *
from USER_CONSTRAINTS
where table_name = 'EMPLOYEES';

select *
from USER_CONSTRAINTS
where table_name = 'DEPARTMENTS';

--106개 (inner 조인, equi 조인)
SELECT last_name,department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

SELECT employees.last_name,departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

--지정된 테이블에 모두 존재하는 컬럼은 반드시 테이블명.컬럼명 형식으로 사용해야 된다
SELECT last_name,department_name, employees.department_id
FROM employees, departments
WHERE employees.department_id = departments.department_id;

--테이블 별칭
SELECT emp.last_name,department_name, emp.department_id
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id;

--주의: 별칭을 지정하면 반드시 별칭을 사용해야 된다. 테이블명 사용불가
SELECT emp.last_name,department_name, emp.department_id
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id;

--검색조건 추가 ==> 오라클 조인은 where 절에 조인조건과 검색조건을 같이 지정한다
SELECT emp.last_name,salary,department_name 
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
AND last_name='Whalen';
--기존 문법 모두 사용 가능
SELECT d.department_name 부서명, COUNT(e.employee_id) 인원수
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND TO_CHAR( hire_date , 'YYYY') <= 2005
GROUP BY d.department_name
order by 2;

--non equi 조인 (employees, job_grades 조인)
SELECT last_name, salary, grade_level
FROM employees e, job_grades g
WHERE e.salary BETWEEN g.lowest_sal AND g.highest_sal;

--3개 테이블 조인
SELECT last_name, salary, department_name, grade_level
FROM employees e, departments d, job_grades g
WHERE e.department_id = d.department_id
AND e.salary BETWEEN g.lowest_sal AND g.highest_sal;

--사원테이블 가상으로 생성
select employee_id, last_name, manager_id
from EMPLOYEES e;    
--관리자 테이블 가상으로 생성
select employee_id, last_name
from EMPLOYEES m;

--106명(inner조인, self조인)
SELECT e.last_name 사원명, m.last_name 관리자명 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

--질문: 사원명e 관리자명m 관리자의관리자명m2
SELECT e.last_name 사원명, m.last_name 관리자명, m2.last_name 관리자의관리자
FROM employees e, employees m, employees m2
WHERE e.manager_id = m.employee_id 
      and m.manager_id = m2.employee_id;
      
      
--outer 조인
SELECT emp.last_name,department_name, emp.department_id
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id(+);

SELECT e.last_name 사원명, m.last_name 관리자명 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+);

SELECT e.last_name 사원명,
 m.last_name 관리자명, mm.last_name "관리자의 관리자명" 
FROM employees e, employees m , employees mm
WHERE e.manager_id = m.employee_id 
AND m.manager_id = mm.employee_id;

SELECT e.last_name 사원명,
 m.last_name 관리자명, mm.last_name "관리자의 관리자명" 
FROM employees e, employees m , employees mm
WHERE e.manager_id = m.employee_id(+) 
AND m.manager_id = mm.employee_id(+);

--cartesion product 조인
select emp.last_name, department_name, emp.department_id
from EMPLOYEES emp, department dept;

select 107 * 27
from dual;

--ANSI 
--natural join --> 공통컬럼은 테이블명.컬럼 또는 별칭.컬럼 사용불가
SELECT last_name,department_name, department_id
FROM employees NATURAL JOIN departments;

SELECT last_name,department_name, department_id
FROM employees e NATURAL JOIN departments d; 

SELECT last_name,department_name, department_id
FROM employees e NATURAL JOIN departments d  --조인조건
WHERE department_id=90;                      --검색조건

--using 절 --> 공통컬럼은 테이블명.컬럼 또는 별칭.컬럼 사용불가
SELECT last_name,department_name, department_id
FROM employees e JOIN departments d USING(department_id);

SELECT last_name,department_name, department_id
FROM employees e inner JOIN departments d USING(department_id);

SELECT last_name,department_name, department_id
FROM employees e JOIN departments d USING(department_id)  --조인조건
WHERE department_id=90;                                    --검색조건

--on 절 : 오라클조인과 동일하게 공통컬럼은 별칭.컬럼 형식으로 사용해야 된다
SELECT last_name,department_name, e.department_id
FROM employees e JOIN departments d 
ON e.department_id = d.department_id;

SELECT last_name,department_name, e.department_id
FROM employees e inner JOIN departments d 
ON e.department_id = d.department_id;

SELECT last_name,department_name, e.department_id
FROM employees e JOIN departments d 
ON e.department_id = d.department_id
WHERE e.department_id=90;

SELECT last_name, salary, grade_level
FROM employees e, job_grades g
WHERE e.salary BETWEEN g.lowest_sal AND g.highest_sal;

SELECT last_name, salary, grade_level
from employees e inner JOIN job_grades g
on e.salary BETWEEN g.lowest_sal AND g.highest_sal;

--self 조인
SELECT e.last_name 사원명, m.last_name 관리자명 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

select e.last_name 사원명, m.last_name 관리자명 
from employees e join employees m
on e.manager_id = m.employee_id;

--3개 테이블 조인
SELECT e.last_name 사원명, d.department_name 부서명,
 g.grade_level 등급
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id
 INNER JOIN job_grades g
ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;

--cross 조인
SELECT last_name,department_name, e.department_id
FROM employees e cross JOIN departments d;

--outer 조인

--106개, department_id 값이 null 가진 grant 사원이 누락됨
SELECT last_name,department_name, department_id
FROM employees e INNER JOIN departments d USING(department_id);

--107개, department_id 값이 null 가진 grant 사원 포함됨
SELECT last_name,department_name, department_id
FROM employees e left outer JOIN departments d USING(department_id);

SELECT last_name,department_name, department_id
FROM departments d right outer JOIN employees e USING(department_id);

SELECT last_name,department_name, department_id
FROM employees e left outer JOIN departments d on e.department_id = d.department_id;

SELECT last_name,department_name, department_id
FROM departments d right outer JOIN employees e on e.department_id = d.department_id;



