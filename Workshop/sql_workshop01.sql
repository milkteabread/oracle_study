--�⺻ select �ǽ�

--1. �а� �̸��� �迭 ǥ��
select DEPARTMENT_NAME as "�а���", CATEGORY as "�迭" 
from TB_DEPARTMENT;

--2. �а� ���� ���
select DEPARTMENT_NAME || '�� ������' || CAPACITY || '�� �Դϴ�.' as "�а��� ����"  
from TB_DEPARTMENT;

--3. Ư�� ������ �����ϴ� �� ã��
select STUDENT_NAME 
from TB_STUDENT
where ABSENCE_YN = 'Y' and DEPARTMENT_NAME = '������а�';

--4. �й� ��ȸ�Ͽ� �̸� ���
select STUDENT_NAME
from TB_STUDENT
where STUDENT_NO IN ('A513079','A513090','A513091','A513110','A513119');

--5. ���������� 20�� �̻� 30�� ������ �а� �̸�, �迭 ���
select DEPARTMENT_NAME, CATEGORY
from TB_DEPARTMENT
where CAPACITY BETWEEN 20 AND 30;

--6. �Ҽ� �а��� ���� ���� �̸� ���
select PROFESSOR_NAME
from TB_PROFESSOR
where DEPARTMENT_NO IS NULL;

--7. �а��� �����Ǿ� ���� ���� �л� ���� Ȯ��
select STUDENT_NAME
from TB_STUDENT
where DEPARTMENT_NO is null;

--8. ���������� �����ϴ� ������ �����ȣ ��ȸ
select CLASS_NO
from TB_CLASS
where PREATTENDING_CLASS_NO is not null;

--9. �迭 ��ȸ
select DISTINCT CATEGORY
from TB_DEPARTMENT;

--10. 02�й� ���� ������ ���л� ���� ��� 
select STUDENT_NO, STUDENT_NAME, STUDENT_SSN
from TB_STUDENT
where ABSENCE_YN is not null and ENTRANCE_DATE like '02%' 
and STUDENT_ADDRESS like '����%';