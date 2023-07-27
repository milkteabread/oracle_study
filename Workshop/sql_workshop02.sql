--�⺻ select �ǽ�2

--1. ���� �⵵ ���� ������ ǥ��
select STUDENT_NO as "�й�", STUDENT_NAME as "�̸�", to_char(ENTRANCE_DATE,'RRRR-MM-DD') as "���г⵵" 
from TB_STUDENT 
where DEPARTMENT_NO = '002'
order by ENTRANCE_DATE;

--2. ���� �����ϴ� ���� ���� ���
select PROFESSOR_NAME, PROFESSOR_SSN
from TB_PROFESSOR
--where length(PROFESSOR_NAME) > 3 and length(PROFESSOR_NAME) < 3;
where PROFESSOR_NAME not like '___';

--3. ������ ���� �̸�, ���� ���
select PROFESSOR_NAME as "�����̸�", to_number(to_char(sysdate,'YYYY'))-to_number('19'||PROFESSOR_SSN,1,2)) as "����"
from TB_PROFESSOR
where substr(PROFESSOR_SSN, 8,1) = '1'
order by PROFESSOR_NAME, PROFESSOR_SSN asc;

--4. ���� �̸��� ���
select substr(PROFESSOR_NAME,2) as "�̸�"
from TB_PROFESSOR;

--5. ����� ������ ���ϱ�
select STUDENT_NO, STUDENT_NAME
from TB_STUDENT
where to_number(to_char(ENTRANCE_DATE,'YYYY')) - to_number(to_char(to_date(substr(STUDENT_SSN,1,2),'RR'),'YYYY')) > 19
order by 1;

--6. 2020 ũ�������� ����
select TO_CHAR(TO_DATE(20201225),'DAY')
from dual;

--8. 2000�⵵ ���� �й� �л� ���
select STUDENT_NO, STUDENT_NAME
from TB_STUDENT
where STUDENT_NO not like 'A%';

--�׷��ռ� �ǽ� ����
--9. ���� �� ���� ���ϱ�
select round(AVG(POINT),1) as "����"
from TB_GRADE;
where STUDENT_NO = 'A517178';

--10. �а��� �л��� ���ϱ�
select DEPARTMENT_NO as "�а���ȣ", COUNT(*) as "�л���"
from TB_STUDENT
group by DEPARTMENT_NO
order by DEPARTMENT_NO;

--11. �������� �������� ���� �л��� ���ϱ�
select count(*)
from TB_STUDENT
where COACH_PROFESSOR_NO is null;

--12. �л��� �⵵�� ���� ���ϱ�
select substr(term_no,1,4) as "�⵵", round(avg(point),1) as "�⵵ �� ����"
from TB_GRADE
where STUDENT_NO = 'A112113'
group by substr(term_no,1,4);

--13. �а��� ���л� �� ���ϱ�
select department_no as "�а��ڵ��", sum(case when absence_yn = 'Y' then 1 else 0 end) as "���л� ��"
from tb_student
group by department_no
order by department_no;

--14. �������� ã��
select student_name as "�����̸�", count(*) as "�����μ�"
from tb_student
group by student_name
having count(*) > 1;