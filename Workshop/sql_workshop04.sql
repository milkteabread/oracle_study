
--1. �������� ã��
select student_name as "�����̸�", count(*) as "�����μ�"
from tb_student
group by student_name
having count(*) > 1;

--2. Ư�� ���� �л��� ���
select student_name as �л��̸�, student_no as �й�, student_address as "������ �ּ�"
from TB_STUDENT
where (STUDENT_ADDRESS like '����%' or STUDENT_ADDRESS like '���%')and STUDENT_NO like '9%'
order by student_name;

--3. ���а� ���� �� ���̰� ���� ������� ���
select department_no
from tb_department
where department_name = '���а�';

select professor_name, PROFESSOR_SSN, department_no
from tb_professor join tb_department USING(department_no)
where department_no = '005'
order by professor_ssn;

--4. ���� �̸��� ������ �а� �̸� ���
SELECT class_name, department_name
FROM tb_class JOIN tb_department USING(department_name);                          
