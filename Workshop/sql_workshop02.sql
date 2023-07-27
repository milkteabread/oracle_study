--기본 select 실습2

--1. 입학 년도 빠른 순으로 표시
select STUDENT_NO as "학번", STUDENT_NAME as "이름", to_char(ENTRANCE_DATE,'RRRR-MM-DD') as "입학년도" 
from TB_STUDENT 
where DEPARTMENT_NO = '002'
order by ENTRANCE_DATE;

--2. 조건 만족하는 교수 정보 출력
select PROFESSOR_NAME, PROFESSOR_SSN
from TB_PROFESSOR
--where length(PROFESSOR_NAME) > 3 and length(PROFESSOR_NAME) < 3;
where PROFESSOR_NAME not like '___';

--3. 남교수 정보 이름, 나이 출력
select PROFESSOR_NAME as "교수이름", to_number(to_char(sysdate,'YYYY'))-to_number('19'||PROFESSOR_SSN,1,2)) as "나이"
from TB_PROFESSOR
where substr(PROFESSOR_SSN, 8,1) = '1'
order by PROFESSOR_NAME, PROFESSOR_SSN asc;

--4. 교수 이름만 출력
select substr(PROFESSOR_NAME,2) as "이름"
from TB_PROFESSOR;

--5. 재수생 입학자 구하기
select STUDENT_NO, STUDENT_NAME
from TB_STUDENT
where to_number(to_char(ENTRANCE_DATE,'YYYY')) - to_number(to_char(to_date(substr(STUDENT_SSN,1,2),'RR'),'YYYY')) > 19
order by 1;

--6. 2020 크리스마스 요일
select TO_CHAR(TO_DATE(20201225),'DAY')
from dual;

--8. 2000년도 이전 학번 학생 출력
select STUDENT_NO, STUDENT_NAME
from TB_STUDENT
where STUDENT_NO not like 'A%';

--그룹합수 실습 문제
--9. 학점 총 평점 구하기
select round(AVG(POINT),1) as "평점"
from TB_GRADE;
where STUDENT_NO = 'A517178';

--10. 학과별 학생수 구하기
select DEPARTMENT_NO as "학과번호", COUNT(*) as "학생수"
from TB_STUDENT
group by DEPARTMENT_NO
order by DEPARTMENT_NO;

--11. 지도교수 배정받지 못한 학생수 구하기
select count(*)
from TB_STUDENT
where COACH_PROFESSOR_NO is null;

--12. 학생의 년도별 평점 구하기
select substr(term_no,1,4) as "년도", round(avg(point),1) as "년도 별 평점"
from TB_GRADE
where STUDENT_NO = 'A112113'
group by substr(term_no,1,4);

--13. 학과별 휴학생 수 구하기
select department_no as "학과코드명", sum(case when absence_yn = 'Y' then 1 else 0 end) as "휴학생 수"
from tb_student
group by department_no
order by department_no;

--14. 동명이인 찾기
select student_name as "동일이름", count(*) as "동명인수"
from tb_student
group by student_name
having count(*) > 1;