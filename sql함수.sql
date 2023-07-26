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
