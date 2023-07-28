
--�������� �˻�
select *
from USER_CONSTRAINTS
where table_name = 'EMPLOYEES';

select *
from USER_CONSTRAINTS
where table_name = 'DEPARTMENTS';

--106�� (inner ����, equi ����)
SELECT last_name,department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

SELECT employees.last_name,departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

--������ ���̺� ��� �����ϴ� �÷��� �ݵ�� ���̺��.�÷��� �������� ����ؾ� �ȴ�
SELECT last_name,department_name, employees.department_id
FROM employees, departments
WHERE employees.department_id = departments.department_id;

--���̺� ��Ī
SELECT emp.last_name,department_name, emp.department_id
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id;

--����: ��Ī�� �����ϸ� �ݵ�� ��Ī�� ����ؾ� �ȴ�. ���̺�� ���Ұ�
SELECT emp.last_name,department_name, emp.department_id
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id;

--�˻����� �߰� ==> ����Ŭ ������ where ���� �������ǰ� �˻������� ���� �����Ѵ�
SELECT emp.last_name,salary,department_name 
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
AND last_name='Whalen';
--���� ���� ��� ��� ����
SELECT d.department_name �μ���, COUNT(e.employee_id) �ο���
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND TO_CHAR( hire_date , 'YYYY') <= 2005
GROUP BY d.department_name
order by 2;

--non equi ���� (employees, job_grades ����)
SELECT last_name, salary, grade_level
FROM employees e, job_grades g
WHERE e.salary BETWEEN g.lowest_sal AND g.highest_sal;

--3�� ���̺� ����
SELECT last_name, salary, department_name, grade_level
FROM employees e, departments d, job_grades g
WHERE e.department_id = d.department_id
AND e.salary BETWEEN g.lowest_sal AND g.highest_sal;

--������̺� �������� ����
select employee_id, last_name, manager_id
from EMPLOYEES e;    
--������ ���̺� �������� ����
select employee_id, last_name
from EMPLOYEES m;

--106��(inner����, self����)
SELECT e.last_name �����, m.last_name �����ڸ� 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

--����: �����e �����ڸ�m �������ǰ����ڸ�m2
SELECT e.last_name �����, m.last_name �����ڸ�, m2.last_name �������ǰ�����
FROM employees e, employees m, employees m2
WHERE e.manager_id = m.employee_id 
      and m.manager_id = m2.employee_id;
      
      
--outer ����
SELECT emp.last_name,department_name, emp.department_id
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id(+);

SELECT e.last_name �����, m.last_name �����ڸ� 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+);

SELECT e.last_name �����,
 m.last_name �����ڸ�, mm.last_name "�������� �����ڸ�" 
FROM employees e, employees m , employees mm
WHERE e.manager_id = m.employee_id 
AND m.manager_id = mm.employee_id;

SELECT e.last_name �����,
 m.last_name �����ڸ�, mm.last_name "�������� �����ڸ�" 
FROM employees e, employees m , employees mm
WHERE e.manager_id = m.employee_id(+) 
AND m.manager_id = mm.employee_id(+);

--cartesion product ����
select emp.last_name, department_name, emp.department_id
from EMPLOYEES emp, department dept;

select 107 * 27
from dual;

--ANSI 
--natural join --> �����÷��� ���̺��.�÷� �Ǵ� ��Ī.�÷� ���Ұ�
SELECT last_name,department_name, department_id
FROM employees NATURAL JOIN departments;

SELECT last_name,department_name, department_id
FROM employees e NATURAL JOIN departments d; 

SELECT last_name,department_name, department_id
FROM employees e NATURAL JOIN departments d  --��������
WHERE department_id=90;                      --�˻�����

--using �� --> �����÷��� ���̺��.�÷� �Ǵ� ��Ī.�÷� ���Ұ�
SELECT last_name,department_name, department_id
FROM employees e JOIN departments d USING(department_id);

SELECT last_name,department_name, department_id
FROM employees e inner JOIN departments d USING(department_id);

SELECT last_name,department_name, department_id
FROM employees e JOIN departments d USING(department_id)  --��������
WHERE department_id=90;                                    --�˻�����

--on �� : ����Ŭ���ΰ� �����ϰ� �����÷��� ��Ī.�÷� �������� ����ؾ� �ȴ�
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

--self ����
SELECT e.last_name �����, m.last_name �����ڸ� 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

select e.last_name �����, m.last_name �����ڸ� 
from employees e join employees m
on e.manager_id = m.employee_id;

--3�� ���̺� ����
SELECT e.last_name �����, d.department_name �μ���,
 g.grade_level ���
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id
 INNER JOIN job_grades g
ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;

--cross ����
SELECT last_name,department_name, e.department_id
FROM employees e cross JOIN departments d;

--outer ����

--106��, department_id ���� null ���� grant ����� ������
SELECT last_name,department_name, department_id
FROM employees e INNER JOIN departments d USING(department_id);

--107��, department_id ���� null ���� grant ��� ���Ե�
SELECT last_name,department_name, department_id
FROM employees e left outer JOIN departments d USING(department_id);

SELECT last_name,department_name, department_id
FROM departments d right outer JOIN employees e USING(department_id);

SELECT last_name,department_name, department_id
FROM employees e left outer JOIN departments d on e.department_id = d.department_id;

SELECT last_name,department_name, department_id
FROM departments d right outer JOIN employees e on e.department_id = d.department_id;



