select *
from user_tables;

--view
--������ sql��
SELECT empno,ename, d.dname, d.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno = 20;

--������ sql�� -> �ܼ�ȭ
CREATE VIEW emp_view
AS
SELECT empno,ename, d.dname, d.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno = 20;
--���ۼ��� ��Ī ���� ����
CREATE VIEW emp_view10(no, name, dname, dno)
AS
SELECT empno,ename, d.dname, d.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno = 20;

--view ����
select *
from emp_view;

--���̺��� Ư�� �÷� ��ȣ ����
--emp�� sal�� �ſ� �ΰ��� �÷��̶�� ����
CREATE VIEW emp_view2
AS
SELECT empno,ename,job,mgr,hiredate,comm,deptno
FROM emp; 

select *
from emp_view2;

--�� ���� ==> alter view sql���� ����. create or replace �̿�
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

--DML (view �����Ҷ� group by, distinct �� ����� dml �ȵ�)
delete from copy_emp_view
where deptno = 20;

--DML �Ұ����ϵ��� �б��� �� ����
create or replace view copy_emp_view2
as
select *
from copy_emp
with read only; --DML �Ұ�
--����
delete from copy_emp_view2
where deptno = 20;

select *
from user_views;

--�����
drop view copy_emp_view;

--������
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
 CYCLE  --�ٽ� ���۰��� minvalue������
 NOCACHE;
 
 --���������� ���� �������� ���: ��������.nextval, ���� �� Ȯ��: ��������.currentval
 select copy_dept_no_seq.nextval
 from dual;
 
 CREATE SEQUENCE dept_deptno_seq2
 START WITH 100
 INCREMENT BY -10
 MAXVALUE 150
 MINVALUE 10
 CYCLE  --�ٽ� ������ maxvalue����
 NOCACHE;

 select dept_deptno_seq2.nextval, dept_deptno_seq2.currval
 from dual;
 
 create sequence my_seq;
 
 --��Ÿ���� (start with �� ������ ����)
 select *
 from user_sequences;
 
 --my_seq ������ �̿��ؼ� copy_dept ���̺��� no�÷��� �ѹ���
 select *
 from copy_dept;
 
insert into copy_dept (no,name,addr) values (my_seq.nextval, 'aa', '����');
insert into copy_dept (no,name,addr) values (my_seq.nextval, 'bb', '����');
insert into copy_dept (no,name,addr) values (my_seq.nextval, 'cc', '����');

drop sequence dept_deptno_seq2;

--index ��ü�� ������ �ִ� �ּҰ�: rowid

select rowid, empno, ename
from emp;

AAAE+J      AAE     AAAGL    AAA
���̺�����  ��������  ������  ������������

select *
from user_indexes
where table_name = 'EMP';  --pk�� empno ������ �ε����� ������

--ename�� �ε��� �߰� ==> ���� �� BƮ���� �����ϴ� ������尡 �ſ� ũ��. ���� �ε����� �����ϸ� �ȵȴ�
CREATE INDEX emp_ename_idx
ON emp(ename);

SELECT * 
FROM emp
WHERE ename='SMITH';
--����� full scan����

drop index emp_ename_idx;
