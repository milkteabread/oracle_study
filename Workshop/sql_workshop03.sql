
select student_ssn as �ֹι�ȣ, student_name as �̸�
from TB_STUDENT
where STUDENT_NAME like '��%' 
order by substr(student_ssn, 8,1) = '2';

select department_name as �а��̸�, count(*) as ����
from TB_DEPARTMENT
group by department_name;
