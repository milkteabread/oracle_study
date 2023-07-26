--기본 select 실습

--1. 학과 이름과 계열 표시
select DEPARTMENT_NAME as "학과명", CATEGORY as "계열" 
from TB_DEPARTMENT;

--2. 학과 정원 출력
select DEPARTMENT_NAME || '의 정원은' || CAPACITY || '명 입니다.' as "학과별 정원"  
from TB_DEPARTMENT;

--3. 특정 조건을 만족하는 값 찾기
select STUDENT_NAME 
from TB_STUDENT
where ABSENCE_YN = 'Y' and DEPARTMENT_NAME = '국어국문학과';

--4. 학번 조회하여 이름 출력
select STUDENT_NAME
from TB_STUDENT
where STUDENT_NO IN ('A513079','A513090','A513091','A513110','A513119');

--5. 입학정원이 20명 이상 30명 이하인 학과 이름, 계열 출력
select DEPARTMENT_NAME, CATEGORY
from TB_DEPARTMENT
where CAPACITY BETWEEN 20 AND 30;

--6. 소속 학과가 없는 총장 이름 출력
select PROFESSOR_NAME
from TB_PROFESSOR
where DEPARTMENT_NO IS NULL;

--7. 학과가 지정되어 있지 않은 학생 여부 확인
select STUDENT_NAME
from TB_STUDENT
where DEPARTMENT_NO is null;

--8. 선수과목이 존재하는 과목의 과목번호 조회
select CLASS_NO
from TB_CLASS
where PREATTENDING_CLASS_NO is not null;

--9. 계열 조회
select DISTINCT CATEGORY
from TB_DEPARTMENT;

--10. 02학번 전주 거주자 재학생 정보 출력 
select STUDENT_NO, STUDENT_NAME, STUDENT_SSN
from TB_STUDENT
where ABSENCE_YN is not null and ENTRANCE_DATE like '02%' 
and STUDENT_ADDRESS like '전주%';