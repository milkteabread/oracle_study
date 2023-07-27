select 25487*895632
from dual;
  
select sysdate
from dual;

--13. 단일행 함수 - 문자함수
SELECT INITCAP('ORACLE SQL')
FROM dual;

SELECT email, INITCAP(email)
FROM employees;

--모두 대문자
SELECT last_name, UPPER(last_name)
FROM employees;

SELECT last_name, salary
FROM employees
WHERE UPPER(last_name)='KING';

--모두 소문자
SELECT last_name, LOWER(last_name)
FROM employees;

--문자열 연결
SELECT CONCAT( last_name, salary)
FROM employees;

--문자열 길이
SELECT last_name, LENGTH(last_name)
FROM employees;

--특정문자 위치
SELECT INSTR('MILLER' , 'L', 1 , 2 ), INSTR('MILLER' , 'X', 1 , 2 )
FROM dual;

SELECT INSTR('MILLER' , 'L', 5 , 2 ), INSTR('MILLER' , 'X', 1 , 2 )
FROM dual;

--부분열
SELECT SUBSTR('900303-1234567' , 8 , 1 ) 
FROM dual;

SELECT SUBSTR('900303-1234567' , 8) 
FROM dual;

--치환
SELECT REPLACE('JACK and JUE' , 'J' , 'BL' ) 
FROM dual;

--왼쪽 채우기
SELECT LPAD('MILLER' , 10 , '*' ) 
FROM dual;

--오른쪽 채우기
SELECT RPAD('MILLER' , 10 , '*' ) 
FROM dual;

--공백, 특정문자 - 왼쪽
SELECT LTRIM('MMMMMIMLLER', 'M')
FROM dual;

SELECT LTRIM('   MILLER   '), LENGTH(LTRIM('   MILLER   '))
FROM dual;

--공백, 특정문자 - 오른쪽
SELECT RTRIM('MILLER', 'R')
FROM dual;

SELECT RTRIM('   MILLER   '), LENGTH(RTRIM('   MILLER   '))
FROM dual;

--특정 문자 삭제 -왼쪽, 오른쪽, 양쪽
SELECT TRIM( '0' FROM '0001234567000' ) 
FROM dual;

SELECT TRIM( LEADING '0' FROM '0001234567000' ) 
FROM dual;  --앞쪽

SELECT TRIM( TRAILING '0' FROM '0001234567000' ) 
FROM dual;  --뒤쪽

SELECT ROUND( 456.789, 2 ) 
FROM dual;

SELECT ROUND( 456.789, -1 ) 
FROM dual;

SELECT ROUND( 456.789 ) 
FROM dual;

SELECT TRUNC( 456.789, 2 ) 
FROM dual;

SELECT TRUNC( 456.789, -1 ) 
FROM dual;

SELECT TRUNC( 456.789 ) 
FROM dual;

-- % 연산자는 나머지 연산자로 사용안됨
SELECT MOD( 10 , 3 ) , MOD( 10 , 0 ) 
FROM dual;

SELECT CEIL(10.6), CEIL(-10.6) 
FROM dual;

SELECT FLOOR(10.6), FLOOR(-10.6) 
FROM dual;

SELECT SIGN( 100 ) , SIGN(-20) , SIGN(0) 
FROM dual;

select *
from NLS_SESSION_PARAMETERS;

create table exam
( a date, b date );

insert into exam(a,b)
values (to_date('15/01/01','RR/MM/DD'), to_date('15/01/01','YY/MM/DD'));

select to_char(a, 'RRRR'), to_char(b,'YYYY')
from exam;

--시스템 년도를 1995년으로 변경
insert into exam(a,b)
values (to_date('15/01/01','RR/MM/DD'), to_date('15/01/01','YY/MM/DD'));

select to_char(a, 'RRRR'), to_char(b,'YYYY')
from exam;

--현재 날짜 반환
SELECT SYSDATE, systimestamp
FROM dual;
--연산 가능
SELECT SYSDATE 오늘, SYSDATE+1 내일, SYSDATE-1 어제
FROM dual;

SELECT last_name, hire_date, TRUNC((sysdate-hire_date)/365) "년" FROM employees
ORDER BY 3 desc;

--지정된 두 날짜의 개월수 반환
SELECT last_name, hire_date, trunc(MONTHS_BETWEEN(sysdate, hire_date)) "근무 월수" FROM employees
ORDER BY 3 desc;

--월 더하기, 빼기
SELECT sysdate 현재, ADD_MONTHS(sysdate,1) 다음달,
 ADD_MONTHS(sysdate,-1) 이전달
FROM dual;

--지정된 날짜기준에 가장 가까운 요일 날짜 반환
SELECT NEXT_DAY(sysdate, '토')
FROM dual;

--지정된 날짜의 월 마지막 날짜 반환
SELECT sysdate, last_day(sysdate), last_day(add_months(sysdate,1))
FROM dual;

--년도, 월 반올림
SELECT last_name, hire_date, 
 ROUND(hire_date,'YEAR'),
 ROUND(hire_date,'MONTH')
FROM employees;

--년도, 월 절삭
SELECT last_name, hire_date, 
 TRUNC(hire_date,'YEAR'),
 TRUNC(hire_date,'MONTH')
FROM employees;

--자동형변환
SELECT last_name, salary
FROM employees
WHERE salary = '17000';

SELECT last_name, salary
FROM employees
WHERE HIRE_DATE = '03/06/17';

--명시적 형변환 (날짜 -> 문자)
select sysdate, to_char(sysdate,'YYYY'), to_char(sysdate,'MM')
from dual;
select sysdate, to_char(sysdate,'YYYY/MM/DD MON DAY DY')
from dual;

select sysdate, to_char(sysdate,'YYYY"년"MM"월"DD"일"')
from dual;

select sysdate, to_char(sysdate,'AM HH HH24 MI SS')
from dual;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD,(AM) DY HH24:MI:SS')
FROM dual;

--날짜에서 특정년도만 추출, 월만 추출, 일만 추출
select sysdate, to_char(sysdate, 'YYYY'), to_char(sysdate, 'MM')
from dual;

select sysdate, extract(year from sysdate),extract(month from sysdate),
                extract(day from sysdate),extract(hour from systimestamp),
               extract(minute from systimestamp),extract(second from systimestamp)
from dual;                

SELECT last_name,hire_date, salary
FROM employees
WHERE TO_CHAR(hire_date, 'MM')='09';

--extract로 변경하기
SELECT last_name,hire_date, salary
FROM employees
WHERE extract(month from hire_date)='09';

--명시적 형변환 (숫자 -> 문자)
SELECT last_name, salary, 
 TO_CHAR(salary, '$999,999') 달러,
 TO_CHAR(salary, 'L999,999') 원화
FROM employees;

select to_char(987654321,'L999,999,999')
from dual;

--명시적 형변환 (문자 -> 숫자)
SELECT TO_NUMBER('123') + 100 
FROM dual;

--명시적 형변환 (문자 -> 날짜)
ALTER SESSION SET NLS_DATE_FORMAT='YYYY/MM/DD HH24:MI:SS';

SELECT TO_DATE( '20170802181030' , 'YYYYMMDDHH24MISS' )
FROM dual;

SELECT TO_DATE( '2017년08월02일' , 'YYYY"년"MM"월"DD"일"' )
FROM dual;

SELECT SYSDATE, SYSDATE-TO_DATE( '20170801' , 'YYYYMMDD' )
FROM dual;

--실제 DB에 날짜를 저장한다면?
--가. 20170802 (권장, Law data)
--나. 2017년08월02일 ==> 문제1: 저장크기 더 필요함, 문제2: 출력시 포맷변경이 제한적임
                      --문제3: Local(지역화)

--조건: decode 함수
SELECT last_name,salary,DECODE(salary,24000, salary*0.3,17000, salary*0.2,salary) 보너스
FROM employees
ORDER BY 2 desc;

SELECT COUNT(*) "총인원수",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2001, 1, 0)) "2001",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2002, 1, 0)) "2002",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2003, 1, 0)) "2003",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2004, 1, 0)) "2004",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2005, 1, 0)) "2005",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2006, 1, 0)) "2006",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2007, 1, 0)) "2007",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2008, 1, 0)) "2008"
FROM employees;

--Decode 실습
CREATE TABLE T_HOLHISTORY
(
SEQ_NU 		 NUMBER  NOT NULL,	-- 사원 순번
YEAR_VC	 	 VARCHAR2(4) NOT NULL,	-- 년도
EMPNO_VC 	 VARCHAR2(4) NOT NULL,	-- 사원번호
STDATE_VC 	 VARCHAR2(4) NOT NULL,	--휴가시작일
SMA_VC 	 	 VARCHAR2(1) NOT NULL,	--휴가 시작 오전 오후
EDDATE_VC 	 VARCHAR2(4) NOT NULL,	--휴가 종료일
EMA_VC 		 VARCHAR2(1) NOT NULL,	--휴가 종료 오전 오후
REASON_VC	 VARCHAR2(100) ,		--휴가 사유
STATE_VC 	 VARCHAR2(2) NOT NULL,	--현재 상태 (0 -> 허가 , 10 -> 대기 , 20 ->불가)	
AEMPNO_VC 	 VARCHAR2(4) NOT NULL,	--허가자 사번
REFUSE_VC 	 VARCHAR2(100) ,		-- 불허가 사유
INDATE_VC 	 VARCHAR2(8)		-- 입력날짜
);

INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (128,2004,'1024','0610',1,'0612',2,'그냥',10,1001,'',20040528);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (129,2004,'2018','0612',1,'0615',2,'여행',0,2001,'',20040607);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (130,2004,'3020','0527',2,'0528',1,'그냥',20,3001,'그냥',20040520);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (131,2004,'2022','0713',1,'0713',2,'병가',0,2001,'',20040712);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (132,2004,'1011','0830',1,'0830',2,'쓰러질거 같음',0,1001,'',20040801);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (133,2004,'1002','0515',1,'0515',2,'허가 안해주면 일 안함',0,1001,'',20040311);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (134,2004,'2027','0811',1,'0811',2,'병가',0,2001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (135,2004,'1024','0915',2,'0915',2,'병원가야됨',0,1001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (136,2004,'1024','0913',1,'0913',1,'그냥',0,1001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (137,2004,'3017','0924',1,'0924',2,'쉬고싶어서',20,3001,'나두 쉬고 싶다…', 20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (138,2004,'4021','0905',1,'0909',2,'휴가',0,4001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (139,2004,'5003','0905',2,'0905',1,'미칠지경임',0,5001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (140,2004,'6028','0904',2,'0905',1,'휴가',0,6001,'',20040811);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (141,2004,'6002','0901',1,'0903',2,'쉬고싶어요',0,6001,'',20040824);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (142,2004,'2018','0823',1,'0827',2,'휴가',10,2001,'',20040817);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (143,2004,'1002','0824',1,'0827',2,'휴가',0,1001,'',20040620);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (144,2004,'1019','0824',1,'0828',2,'쉬고싶어서',10,1001,'기다려바바',20040723);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (145,2004,'5003','0815',1,'0820',2,'휴가',0,5001,'',20040726);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (146,2004,'4007','0728',1,'0801',2,'환장할 듯.. 무조건 휴가 보내줘요',0,4001,'',20040729);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (147,2004,'6014','0920',1,'0925',2,'휴가',0,6001,'',20040830);
COMMIT;

--문제1) 각각의 사원번호에 대해 휴가 시작일과 휴가 종료일을 보여주되, 오전오후의 속성인
        --SMA_VC와 EMA_VC를 이용하여 1일 경우는 오전, 2일 경우는 오후로 출력하시오.
select EMPNO_VC as "사번", STDATE_VC as "휴가시작일",
      decode(SMA_VC,1, '오전', 2, '오후') "오전오후",
      EDDATE_VC as "휴가종료일",
      decode(EMA_VC,1, '오전', 2, '오후') "오전오후"        
from T_HOLHISTORY;

--문제2) 사원번호와 휴가신청 상태를 표시하되 상태( STATE_VC)의 
      --현재상태 코드가 0일 경우 허가 , 10일 경우대기 , 20일 경우 불허가로 표시하시오.
select EMPNO_VC as "사번", STDATE_VC as "휴가시작일",
      decode(STATE_VC,0, '허가', 10, '대기', 20, '불허가') "상태"
from T_HOLHISTORY;

--CASE : ANSI SQL, 동등비교
SELECT last_name,salary,
CASE salary WHEN 24000 THEN salary*0.3
WHEN 17000 THEN salary*0.2
ELSE salary 
END as 보너스 FROM employees
ORDER BY 2 desc;

--CASE : ANSI SQL, 부등비교
SELECT last_name,salary,
CASE WHEN salary >=20000 THEN 1000
WHEN salary >=15000 THEN 2000
WHEN salary >=10000 THEN 3000
ELSE 4000 
END 보너스 FROM employees
ORDER BY 2 desc;

SELECT last_name,salary,
CASE WHEN salary BETWEEN 20000 AND 25000 THEN '상'
WHEN salary BETWEEN 10000 AND 20001 THEN '중'
ELSE '하'
END 등급 FROM employees
ORDER BY 2 desc;

