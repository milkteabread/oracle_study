
--1. 동명이인 찾기
select student_name as "동일이름", count(*) as "동명인수"
from tb_student
group by student_name
having count(*) > 1;

--2. 특정 조건 학생들 출력
select student_name as 학생이름, student_no as 학번, student_address as "거주지 주소"
from TB_STUDENT
where (STUDENT_ADDRESS like '강원%' or STUDENT_ADDRESS like '경기%')and STUDENT_NO like '9%'
order by student_name;

--3. 법학과 교수 중 나이가 많은 사람부터 출력
select department_no
from tb_department
where department_name = '법학과';

select professor_name, PROFESSOR_SSN, department_no
from tb_professor join tb_department USING(department_no)
where department_no = '005'
order by professor_ssn;

--4. 과목 이름과 과목의 학과 이름 출력
SELECT class_name, department_name
FROM tb_class JOIN tb_department USING(department_name);                          
