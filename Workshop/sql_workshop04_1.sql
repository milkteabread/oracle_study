
--�а� ���� 10% ������Ű��
update TB_DEPARTMENT
set capacity = round(capacity*1.1, 0);

SELECT *
from TB_DEPARTMENT;
rollback;

--Ư�� �л� �ּ� �����ϱ�
update TB_STUDENT
set STUDENT_ADDRESS = '����� ���α� ���ε� 181-21'
where STUDENT_NO = 'A413042';

select *
from TB_STUDENT;
rollback;

--�ֹι�ȣ ���ڸ��� �����ϱ�
update TB_STUDENT
set STUDENT_SSN = SUBSTR(STUDENT_SSN , 1, 6);
rollback;

--���� �����ϱ�
update  TB_GRADE
set  POINT = 3.5
where TERM_NO = ��200501��
and CLASS_NO = (select CLASS_NO
                from TB_CLASS
                where CLASS_NAME = ���Ǻλ����С� )
and STUDENT_NO = (select STUDENT_NO
                  from TB_STUDENT
                  join TB_DEPARTMENT using (DEPARTMENT_NO)
                  where STUDENT_NAME = ������ơ�
                  and DEPARTMENT_NAME = �����а��� );
rollback;

--���л� �����׸� �����ϱ�
delete from TB_GRADE
where STUDENT_NO in (select STUDENT_NO
                     from TB_STUDENT
                     where  ABSENCE_YN = ��Y��);

