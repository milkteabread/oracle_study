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

select *
from NLS_SESSION_PARAMETERS;

create table exam
( a date, b date );

insert into exam(a,b)
values (to_date('15/01/01','RR/MM/DD'), to_date('15/01/01','YY/MM/DD'));

select to_char(a, 'RRRR'), to_char(b,'YYYY')
from exam;

--�ý��� �⵵�� 1995������ ����
insert into exam(a,b)
values (to_date('15/01/01','RR/MM/DD'), to_date('15/01/01','YY/MM/DD'));

select to_char(a, 'RRRR'), to_char(b,'YYYY')
from exam;

--���� ��¥ ��ȯ
SELECT SYSDATE, systimestamp
FROM dual;
--���� ����
SELECT SYSDATE ����, SYSDATE+1 ����, SYSDATE-1 ����
FROM dual;

SELECT last_name, hire_date, TRUNC((sysdate-hire_date)/365) "��" FROM employees
ORDER BY 3 desc;

--������ �� ��¥�� ������ ��ȯ
SELECT last_name, hire_date, trunc(MONTHS_BETWEEN(sysdate, hire_date)) "�ٹ� ����" FROM employees
ORDER BY 3 desc;

--�� ���ϱ�, ����
SELECT sysdate ����, ADD_MONTHS(sysdate,1) ������,
 ADD_MONTHS(sysdate,-1) ������
FROM dual;

--������ ��¥���ؿ� ���� ����� ���� ��¥ ��ȯ
SELECT NEXT_DAY(sysdate, '��')
FROM dual;

--������ ��¥�� �� ������ ��¥ ��ȯ
SELECT sysdate, last_day(sysdate), last_day(add_months(sysdate,1))
FROM dual;

--�⵵, �� �ݿø�
SELECT last_name, hire_date, 
 ROUND(hire_date,'YEAR'),
 ROUND(hire_date,'MONTH')
FROM employees;

--�⵵, �� ����
SELECT last_name, hire_date, 
 TRUNC(hire_date,'YEAR'),
 TRUNC(hire_date,'MONTH')
FROM employees;

--�ڵ�����ȯ
SELECT last_name, salary
FROM employees
WHERE salary = '17000';

SELECT last_name, salary
FROM employees
WHERE HIRE_DATE = '03/06/17';

--����� ����ȯ (��¥ -> ����)
select sysdate, to_char(sysdate,'YYYY'), to_char(sysdate,'MM')
from dual;
select sysdate, to_char(sysdate,'YYYY/MM/DD MON DAY DY')
from dual;

select sysdate, to_char(sysdate,'YYYY"��"MM"��"DD"��"')
from dual;

select sysdate, to_char(sysdate,'AM HH HH24 MI SS')
from dual;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD,(AM) DY HH24:MI:SS')
FROM dual;

--��¥���� Ư���⵵�� ����, ���� ����, �ϸ� ����
select sysdate, to_char(sysdate, 'YYYY'), to_char(sysdate, 'MM')
from dual;

select sysdate, extract(year from sysdate),extract(month from sysdate),
                extract(day from sysdate),extract(hour from systimestamp),
               extract(minute from systimestamp),extract(second from systimestamp)
from dual;                

SELECT last_name,hire_date, salary
FROM employees
WHERE TO_CHAR(hire_date, 'MM')='09';

--extract�� �����ϱ�
SELECT last_name,hire_date, salary
FROM employees
WHERE extract(month from hire_date)='09';

--����� ����ȯ (���� -> ����)
SELECT last_name, salary, 
 TO_CHAR(salary, '$999,999') �޷�,
 TO_CHAR(salary, 'L999,999') ��ȭ
FROM employees;

select to_char(987654321,'L999,999,999')
from dual;

--����� ����ȯ (���� -> ����)
SELECT TO_NUMBER('123') + 100 
FROM dual;

--����� ����ȯ (���� -> ��¥)
ALTER SESSION SET NLS_DATE_FORMAT='YYYY/MM/DD HH24:MI:SS';

SELECT TO_DATE( '20170802181030' , 'YYYYMMDDHH24MISS' )
FROM dual;

SELECT TO_DATE( '2017��08��02��' , 'YYYY"��"MM"��"DD"��"' )
FROM dual;

SELECT SYSDATE, SYSDATE-TO_DATE( '20170801' , 'YYYYMMDD' )
FROM dual;

--���� DB�� ��¥�� �����Ѵٸ�?
--��. 20170802 (����, Law data)
--��. 2017��08��02�� ==> ����1: ����ũ�� �� �ʿ���, ����2: ��½� ���˺����� ��������
                      --����3: Local(����ȭ)

--����: decode �Լ�
SELECT last_name,salary,DECODE(salary,24000, salary*0.3,17000, salary*0.2,salary) ���ʽ�
FROM employees
ORDER BY 2 desc;

SELECT COUNT(*) "���ο���",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2001, 1, 0)) "2001",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2002, 1, 0)) "2002",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2003, 1, 0)) "2003",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2004, 1, 0)) "2004",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2005, 1, 0)) "2005",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2006, 1, 0)) "2006",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2007, 1, 0)) "2007",
 SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 2008, 1, 0)) "2008"
FROM employees;

--Decode �ǽ�
CREATE TABLE T_HOLHISTORY
(
SEQ_NU 		 NUMBER  NOT NULL,	-- ��� ����
YEAR_VC	 	 VARCHAR2(4) NOT NULL,	-- �⵵
EMPNO_VC 	 VARCHAR2(4) NOT NULL,	-- �����ȣ
STDATE_VC 	 VARCHAR2(4) NOT NULL,	--�ް�������
SMA_VC 	 	 VARCHAR2(1) NOT NULL,	--�ް� ���� ���� ����
EDDATE_VC 	 VARCHAR2(4) NOT NULL,	--�ް� ������
EMA_VC 		 VARCHAR2(1) NOT NULL,	--�ް� ���� ���� ����
REASON_VC	 VARCHAR2(100) ,		--�ް� ����
STATE_VC 	 VARCHAR2(2) NOT NULL,	--���� ���� (0 -> �㰡 , 10 -> ��� , 20 ->�Ұ�)	
AEMPNO_VC 	 VARCHAR2(4) NOT NULL,	--�㰡�� ���
REFUSE_VC 	 VARCHAR2(100) ,		-- ���㰡 ����
INDATE_VC 	 VARCHAR2(8)		-- �Է³�¥
);

INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (128,2004,'1024','0610',1,'0612',2,'�׳�',10,1001,'',20040528);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (129,2004,'2018','0612',1,'0615',2,'����',0,2001,'',20040607);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (130,2004,'3020','0527',2,'0528',1,'�׳�',20,3001,'�׳�',20040520);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (131,2004,'2022','0713',1,'0713',2,'����',0,2001,'',20040712);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (132,2004,'1011','0830',1,'0830',2,'�������� ����',0,1001,'',20040801);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (133,2004,'1002','0515',1,'0515',2,'�㰡 �����ָ� �� ����',0,1001,'',20040311);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (134,2004,'2027','0811',1,'0811',2,'����',0,2001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (135,2004,'1024','0915',2,'0915',2,'�������ߵ�',0,1001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (136,2004,'1024','0913',1,'0913',1,'�׳�',0,1001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (137,2004,'3017','0924',1,'0924',2,'����;',20,3001,'���� ���� �ʹ١�', 20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (138,2004,'4021','0905',1,'0909',2,'�ް�',0,4001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (139,2004,'5003','0905',2,'0905',1,'��ĥ������',0,5001,'',20040808);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (140,2004,'6028','0904',2,'0905',1,'�ް�',0,6001,'',20040811);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (141,2004,'6002','0901',1,'0903',2,'����;��',0,6001,'',20040824);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (142,2004,'2018','0823',1,'0827',2,'�ް�',10,2001,'',20040817);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (143,2004,'1002','0824',1,'0827',2,'�ް�',0,1001,'',20040620);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (144,2004,'1019','0824',1,'0828',2,'����;',10,1001,'��ٷ��ٹ�',20040723);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (145,2004,'5003','0815',1,'0820',2,'�ް�',0,5001,'',20040726);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (146,2004,'4007','0728',1,'0801',2,'ȯ���� ��.. ������ �ް� �������',0,4001,'',20040729);
INSERT INTO T_HOLHISTORY (SEQ_NU,YEAR_VC ,EMPNO_VC ,STDATE_VC,SMA_VC ,EDDATE_VC,EMA_VC ,REASON_VC,STATE_VC ,AEMPNO_VC,REFUSE_VC,INDATE_VC) VALUES (147,2004,'6014','0920',1,'0925',2,'�ް�',0,6001,'',20040830);
COMMIT;

--����1) ������ �����ȣ�� ���� �ް� �����ϰ� �ް� �������� �����ֵ�, ���������� �Ӽ���
        --SMA_VC�� EMA_VC�� �̿��Ͽ� 1�� ���� ����, 2�� ���� ���ķ� ����Ͻÿ�.
select EMPNO_VC as "���", STDATE_VC as "�ް�������",
      decode(SMA_VC,1, '����', 2, '����') "��������",
      EDDATE_VC as "�ް�������",
      decode(EMA_VC,1, '����', 2, '����') "��������"        
from T_HOLHISTORY;

--����2) �����ȣ�� �ް���û ���¸� ǥ���ϵ� ����( STATE_VC)�� 
      --������� �ڵ尡 0�� ��� �㰡 , 10�� ����� , 20�� ��� ���㰡�� ǥ���Ͻÿ�.
select EMPNO_VC as "���", STDATE_VC as "�ް�������",
      decode(STATE_VC,0, '�㰡', 10, '���', 20, '���㰡') "����"
from T_HOLHISTORY;

--CASE : ANSI SQL, �����
SELECT last_name,salary,
CASE salary WHEN 24000 THEN salary*0.3
WHEN 17000 THEN salary*0.2
ELSE salary 
END as ���ʽ� FROM employees
ORDER BY 2 desc;

--CASE : ANSI SQL, �ε��
SELECT last_name,salary,
CASE WHEN salary >=20000 THEN 1000
WHEN salary >=15000 THEN 2000
WHEN salary >=10000 THEN 3000
ELSE 4000 
END ���ʽ� FROM employees
ORDER BY 2 desc;

SELECT last_name,salary,
CASE WHEN salary BETWEEN 20000 AND 25000 THEN '��'
WHEN salary BETWEEN 10000 AND 20001 THEN '��'
ELSE '��'
END ��� FROM employees
ORDER BY 2 desc;

