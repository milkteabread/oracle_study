
--학과 정원 10% 증가시키기
update TB_DEPARTMENT
set capacity = round(capacity*1.1, 0);

SELECT *
from TB_DEPARTMENT;
rollback;

--특정 학생 주소 변경하기
update TB_STUDENT
set STUDENT_ADDRESS = '서울시 종로구 숭인동 181-21'
where STUDENT_NO = 'A413042';

select *
from TB_STUDENT;
rollback;

--주민번호 앞자리만 저장하기
update TB_STUDENT
set STUDENT_SSN = SUBSTR(STUDENT_SSN , 1, 6);
rollback;

--학점 변경하기
update  TB_GRADE
set  POINT = 3.5
where TERM_NO = ‘200501’
and CLASS_NO = (select CLASS_NO
                from TB_CLASS
                where CLASS_NAME = ‘피부생리학’ )
and STUDENT_NO = (select STUDENT_NO
                  from TB_STUDENT
                  join TB_DEPARTMENT using (DEPARTMENT_NO)
                  where STUDENT_NAME = ‘김명훈’
                  and DEPARTMENT_NAME = ‘의학과’ );
rollback;

--휴학생 성적항목 제거하기
delete from TB_GRADE
where STUDENT_NO in (select STUDENT_NO
                     from TB_STUDENT
                     where  ABSENCE_YN = ‘Y’);

