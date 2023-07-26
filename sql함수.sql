select 25487*895632
from dual;
  
select sysdate
from dual;

--13. ������ �Լ� - �����Լ�
SELECT INITCAP('ORACLE SQL')
FROM dual;

SELECT email, INITCAP(email)
FROM employees;

--��� �빮��
SELECT last_name, UPPER(last_name)
FROM employees;

SELECT last_name, salary
FROM employees
WHERE UPPER(last_name)='KING';

--��� �ҹ���
SELECT last_name, LOWER(last_name)
FROM employees;

--���ڿ� ����
SELECT CONCAT( last_name, salary)
FROM employees;

--���ڿ� ����
SELECT last_name, LENGTH(last_name)
FROM employees;

--Ư������ ��ġ
SELECT INSTR('MILLER' , 'L', 1 , 2 ), INSTR('MILLER' , 'X', 1 , 2 )
FROM dual;

SELECT INSTR('MILLER' , 'L', 5 , 2 ), INSTR('MILLER' , 'X', 1 , 2 )
FROM dual;

--�κп�
SELECT SUBSTR('900303-1234567' , 8 , 1 ) 
FROM dual;

SELECT SUBSTR('900303-1234567' , 8) 
FROM dual;

--ġȯ
SELECT REPLACE('JACK and JUE' , 'J' , 'BL' ) 
FROM dual;

--���� ä���
SELECT LPAD('MILLER' , 10 , '*' ) 
FROM dual;

--������ ä���
SELECT RPAD('MILLER' , 10 , '*' ) 
FROM dual;

--����, Ư������ - ����
SELECT LTRIM('MMMMMIMLLER', 'M')
FROM dual;

SELECT LTRIM('   MILLER   '), LENGTH(LTRIM('   MILLER   '))
FROM dual;

--����, Ư������ - ������
SELECT RTRIM('MILLER', 'R')
FROM dual;

SELECT RTRIM('   MILLER   '), LENGTH(RTRIM('   MILLER   '))
FROM dual;

--Ư�� ���� ���� -����, ������, ����
SELECT TRIM( '0' FROM '0001234567000' ) 
FROM dual;

SELECT TRIM( LEADING '0' FROM '0001234567000' ) 
FROM dual;  --����

SELECT TRIM( TRAILING '0' FROM '0001234567000' ) 
FROM dual;  --����

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

-- % �����ڴ� ������ �����ڷ� ���ȵ�
SELECT MOD( 10 , 3 ) , MOD( 10 , 0 ) 
FROM dual;

SELECT CEIL(10.6), CEIL(-10.6) 
FROM dual;

SELECT FLOOR(10.6), FLOOR(-10.6) 
FROM dual;

SELECT SIGN( 100 ) , SIGN(-20) , SIGN(0) 
FROM dual;
