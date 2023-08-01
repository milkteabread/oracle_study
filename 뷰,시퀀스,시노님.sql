select *
from user_tables;

--view
--복잡한 sql문
SELECT empno,ename, d.dname, d.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno = 20;

--복잡한 sql문 -> 단순화
CREATE VIEW emp_view
AS
SELECT empno,ename, d.dname, d.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno = 20;
--뷰작성시 별칭 지정 가능
CREATE VIEW emp_view10(no, name, dname, dno)
AS
SELECT empno,ename, d.dname, d.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno = 20;

--view 실행
select *
from emp_view;

--테이블의 특정 컬럼 보호 목적
--emp의 sal이 매우 민감한 컬럼이라고 가정
CREATE VIEW emp_view2
AS
SELECT empno,ename,job,mgr,hiredate,comm,deptno
FROM emp; 

select *
from emp_view2;

--뷰 수정 ==> alter view sql문은 없다. create or replace 이용
CREATE OR REPLACE VIEW emp_view2
AS
SELECT empno,ename,job
FROM emp; 

--CTAS
create table copy_emp
as
select *
from emp;

select *
from copy_emp;

create or replace view copy_emp_view
as
select *
from copy_emp;  --base table

--DML (view 생성할때 group by, distinct 등 적용시 dml 안됨)
delete from copy_emp_view
where deptno = 20;

--DML 불가능하도록 읽기모드 뷰 생성
create or replace view copy_emp_view2
as
select *
from copy_emp
with read only; --DML 불가
--에러
delete from copy_emp_view2
where deptno = 20;

select *
from user_views;

--뷰삭제
drop view copy_emp_view;

--시퀀스
--base table
create table copy_dept
as
select deptno as no, dname as name, loc as addr
from dept
where 1=2;

select *
from copy_dept;

CREATE SEQUENCE copy_dept_no_seq
 START WITH 10
 INCREMENT BY 10
 MAXVALUE 100
 MINVALUE 5
 CYCLE  --다시 시작값은 minvalue값부터
 NOCACHE;
 
 --시퀀스에서 값을 가져오는 방법: 시퀀스명.nextval, 현재 값 확인: 시퀀스명.currentval
 select copy_dept_no_seq.nextval
 from dual;
 
 CREATE SEQUENCE dept_deptno_seq2
 START WITH 100
 INCREMENT BY -10
 MAXVALUE 150
 MINVALUE 10
 CYCLE  --다시 시작은 maxvalue부터
 NOCACHE;

 select dept_deptno_seq2.nextval, dept_deptno_seq2.currval
 from dual;
 
 create sequence my_seq;
 
 --메타정보 (start with 값 정보는 없다)
 select *
 from user_sequences;
 
 --my_seq 시퀀스 이용해서 copy_dept 테이블의 no컬럼을 넘버링
 select *
 from copy_dept;
 
insert into copy_dept (no,name,addr) values (my_seq.nextval, 'aa', '서울');
insert into copy_dept (no,name,addr) values (my_seq.nextval, 'bb', '서울');
insert into copy_dept (no,name,addr) values (my_seq.nextval, 'cc', '서울');

drop sequence dept_deptno_seq2;

--index 객체가 가지고 있는 주소값: rowid

select rowid, empno, ename
from emp;

AAAE+J      AAE     AAAGL    AAA
테이블정보  파일정보  블럭정보  블럭내의행정보

select *
from user_indexes
where table_name = 'EMP';  --pk인 empno 때문에 인덱스가 존재함

--ename에 인덱스 추가 ==> 정렬 및 B트리를 구현하는 오버헤드가 매우 크다. 따라서 인덱스는 남발하면 안된다
CREATE INDEX emp_ename_idx
ON emp(ename);

SELECT * 
FROM emp
WHERE ename='SMITH';
--현재는 full scan했음

drop index emp_ename_idx;
