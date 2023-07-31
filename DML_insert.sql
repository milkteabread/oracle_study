
INSERT INTO dept( deptno, dname, loc )
VALUES ( 50 ,'개발','서울');

INSERT INTO dept( deptno, dname)
VALUES ( 51 ,'개발');

INSERT INTO dept
VALUES ( 60 ,'인사','경기');

INSERT INTO dept
VALUES ( 80 ,'인사',null);

commit;

select *
from dept;

--
CREATE TABLE mydept
AS
SELECT * FROM dept
WHERE 1=2;

CREATE TABLE mydept10
AS
SELECT * FROM dept;

--mydept
select *
from mydept;

INSERT INTO mydept
SELECT deptno,dname,loc
FROM dept;

--무조건 insert all
CREATE TABLE myemp_hire
AS
SELECT empno,ename,hiredate,sal
FROM emp
WHERE 1=2;

CREATE TABLE myemp_mgr
AS
SELECT empno,ename,mgr
FROM emp
WHERE 1=2;

select *
from myemp_mgr;

INSERT ALL
INTO myemp_hire VALUES ( empno,ename,hiredate,sal )
INTO myemp_mgr VALUES ( empno,ename,mgr )
SELECT empno,ename,hiredate,sal,mgr
FROM emp;

commit;

SELECT empno,ename,hiredate,sal, mgr
from emp;

--조건 insert all
CREATE TABLE myemp_hire2
AS
SELECT empno,ename,hiredate,sal
FROM emp
WHERE 1=2;

CREATE TABLE myemp_mgr2
AS
SELECT empno,ename,mgr,sal
FROM emp
WHERE 1=2;

select *
from myemp_hire2;

select *
from myemp_mgr2;

INSERT ALL
WHEN sal = 800 THEN
 INTO myemp_hire2 VALUES ( empno,ename,hiredate,sal )
WHEN sal < 2500 THEN
 INTO myemp_mgr2 VALUES ( empno,ename,mgr,sal )
SELECT empno,ename,hiredate,sal,mgr
FROM emp;

--insert first
CREATE TABLE myemp_hire3
AS
SELECT empno,ename,hiredate,sal
FROM emp
WHERE 1=2;

CREATE TABLE myemp_mgr3
AS
SELECT empno,ename,mgr,sal
FROM emp
WHERE 1=2;

INSERT FIRST
WHEN sal = 800 THEN
 INTO myemp_hire3 VALUES ( empno,ename,hiredate,sal )
WHEN sal < 2500 THEN
 INTO myemp_mgr3 VALUES ( empno,ename,mgr,sal )
SELECT empno,ename,hiredate,sal,mgr
FROM emp;



