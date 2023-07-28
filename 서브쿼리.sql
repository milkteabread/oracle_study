
--��������
SELECT salary
FROM employees
WHERE last_name='Whalen'; --4400

SELECT last_name,salary
FROM employees
WHERE salary >= 4400;

--��������
SELECT last_name,salary
FROM employees
WHERE salary >= (SELECT salary  --��������
                FROM employees
                WHERE last_name='Whalen');
                
--������� ��տ��޺��� �� ���� ������ �޴� ��� ��ȸ
SELECT avg(salary)
FROM employees;  --6461.83

select *
from employees
where salary >= 6461.83;

select *
from employees
where salary >= (SELECT avg(salary)
                  FROM employees);
                  
--������ �μ���ȣ�� 100�� ����� �߿��� �ִ� ������ �޴� ����� ������ ������ �޴� ����� ��ȸ
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
                  
--���߿����� > all : �ִ밪���� ū���� ��ȸ
SELECT last_name, department_id, salary
FROM employees
WHERE salary > all (SELECT salary
                FROM employees
                WHERE job_id = 'IT_PROG');
                
--���߿����� < all : �ּҰ����� �������� ��ȸ(�ּ� ���޺��� ����)
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

--���߿����� -- > any: �ּҰ����� ū �������� ��ȸ
SELECT last_name, department_id, salary
FROM employees
WHERE salary > ANY (SELECT salary
                   FROM employees
                    WHERE job_id = 'IT_PROG');
                    
 --���߿����� -- < any: �ִ밪���� ���� �������� ��ȸ
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

--�����÷� ��������
SELECT last_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN ( SELECT department_id, MAX(salary)
 FROM employees
GROUP BY department_id )
ORDER BY 2;

--�ζ��� ��
SELECT e.department_id , SUM(salary) ����, AVG(salary) ���, COUNT(*) �ο���
FROM employees e , departments d
WHERE e.department_id = d.department_id
GROUP BY e.department_id
ORDER BY 1;

SELECT e.department_id, ����, ���, �ο���
FROM ( SELECT department_id, SUM(salary) ����, AVG(salary) ��� ,
 COUNT(*) �ο��� 
 FROM employees
 GROUP BY department_id ) e, departments d
WHERE e.department_id = d.department_id
ORDER By 1;