
select student_ssn as 주민번호, student_name as 이름
from TB_STUDENT
where STUDENT_NAME like '김%' 
order by substr(student_ssn, 8,1) = '2';

select department_name as 학과이름, count(*) as 정원
from TB_DEPARTMENT
group by department_name;
