 
 --�ѱ� byte Ȯ��
select *
from NLS_DATABASE_PARAMETERS
where parameter = 'NLS_CHARACTERSET';

--�Ϲ����� ���1
-- => ���������� ���� ������ ��� �÷��� �ߺ� ����, null ����
-- => �����Ҷ� �÷����� ������� ���� �÷��� �ڵ����� null ����
CREATE TABLE scott.employee
( empno NUMBER(4),
 ename VARCHAR2(20),
 hiredate DATE,
 sal NUMBER(7,2));
 
 CREATE TABLE employee10
( empno NUMBER(4),
 ename VARCHAR2(20),
 hiredate DATE,
 sal NUMBER(7,2));

--�Ϲ����� ���2 - default �ɼ�
-- => �÷���2�� ��������� ���� �������� �ʾƵ� �ڵ����� �⺻������ ����(null ���� ���� ���)
-- => ��¥, ����
CREATE TABLE employee2
( empno NUMBER(4),
 ename VARCHAR2(20),
 hiredate DATE DEFAULT SYSDATE,
 sal NUMBER(7,2));
 
 INSERT INTO employee2 ( empno,ename,sal)
VALUES ( 10, 'ȫ�浿',3000);

select *
from employee2;

--�Ϲ����� ���3 - �������� (constraints) 
--�������� 5�� ���� p.250
--a. �÷� ���� ���: �÷��� �����Ҷ� ���������� ���� �����ϴ� ���
--b. ���̺� ���� ���: �÷��� ��� ������ �Ŀ� ���� �������� ���������� ���� �����ϴ� ���

--��������
--�÷������� primary key ��������Ÿ�� ����
CREATE TABLE department
( deptno NUMBER(2) CONSTRAINT department_deptno_pk PRIMARY KEY,
 dname VARCHAR2(15),
 loc VARCHAR2(15) );
 
 CREATE TABLE department10
( deptno NUMBER(2) PRIMARY KEY,
 dname VARCHAR2(15),
 loc VARCHAR2(15) );
 
 --�������� Ȯ��
 select *
 from user_constraints
 where table_name = 'DEPARTMENT10';


--���̺� ������ primary key ��������Ÿ�� ����
CREATE TABLE department2
( deptno NUMBER(2), 
 dname VARCHAR2(15),
 loc VARCHAR2(15) ,
 CONSTRAINT department2_deptno_pk PRIMARY KEY(deptno)
);
CREATE TABLE department3
( deptno NUMBER(2), 
 dname VARCHAR2(15),
 loc VARCHAR2(15) ,
 CONSTRAINT department3_deptno_pk PRIMARY KEY(deptno, loc) --�����÷��� ���̺� ������ ����
);

--�÷� ������ unique ��������Ÿ�� ����
CREATE TABLE department4
( deptno NUMBER(2) CONSTRAINT department4_deptno_pk PRIMARY KEY, --unique, not null
 dname VARCHAR2(15) CONSTRAINT department4_dname_uk UNIQUE,      --unique, null ���
 loc VARCHAR2(15) );
 
insert into department4 ( deptno, dname, loc ) values ( 1, 'aa', 'bb');
insert into department4 ( deptno, dname, loc ) values ( 2, null, 'bb');

--���̺� ������ unique ��������Ÿ�� ����
CREATE TABLE department5
( deptno NUMBER(2) CONSTRAINT department5_deptno_pk PRIMARY KEY,
 dname VARCHAR2(15), 
 loc VARCHAR2(15),
 CONSTRAINT department5_dname_uk UNIQUE(dname)
);
CREATE TABLE department11
( deptno NUMBER(2),
 dname VARCHAR2(15), 
 loc VARCHAR2(15),
CONSTRAINT department11_deptno_pk PRIMARY KEY(deptno),
CONSTRAINT department11_dname_uk UNIQUE(dname)
);

--###########################################
--�÷� ������ not null ��������Ÿ�� ����
CREATE TABLE department6
( deptno NUMBER(2) CONSTRAINT department6_deptno_pk PRIMARY KEY,
 dname VARCHAR2(15) CONSTRAINT department6_dname_uk UNIQUE,
 loc VARCHAR2(15) CONSTRAINT department6_loc_nn NOT NULL);
 
 CREATE TABLE department12
( deptno NUMBER(2) ,
 dname VARCHAR2(15),
 loc VARCHAR2(15) CONSTRAINT department12_loc_nn NOT NULL,
 CONSTRAINT department12_deptno_pk PRIMARY KEY(deptno),
  CONSTRAINT department12_dname_uk UNIQUE(dname)
  );
 
 --���̺� ������ not null ��������Ÿ���� ���� �ȵ�
 
 --�÷� ������ check ��������Ÿ�� ����
 CREATE TABLE department7
( deptno NUMBER(2) ,
 dname VARCHAR2(15),
 CONSTRAINT department7_dname_ck CHECK( dname IN('����','�λ�')) ,
 loc VARCHAR2(15) 
);
insert into department8 ( deptno, dname, loc ) values ( 1, '����', 'bb');
insert into department8 ( deptno, dname, loc ) values ( 2, '�λ�', 'bb');

insert into department8 ( deptno, dname, loc ) values ( 3, '����', 'bb');  --����

--���̺� ������ check ��������Ÿ�� ����
CREATE TABLE department8
( deptno NUMBER(2) ,
 dname VARCHAR2(15),
 loc VARCHAR2(15),
CONSTRAINT department8_dname_ck CHECK( dname IN('����','�λ�')) 
);

--FK �ǽ�

--master ���̺� ����
create table m1 
( no NUMBER(2) constraint m1_no_pk PRIMARY KEY,
  name VARCHAR2(10) );
  
insert into m1 (no, name) values (10, 'aa');
insert into m1 (no, name) values (20, 'bb');
insert into m1 (no, name) values (30, 'cc');
commit;

select *
from m1;

--slave ���̺�
create table s1
( num NUMBER(4) CONSTRAINT s1_num_pk PRIMARY KEY,
  email VARCHAR2(20),
  -- FK �۾�
  no NUMBER(2) CONSTRAINT s1_no_fk REFERENCES m1(no)
  );
  
  insert into s1 (num, email, no) values (100, 'jjj', 10);
  insert into s1 (num, email, no) values (200, 'xxx', 20);
  insert into s1 (num, email, no) values (300, 'ttt', 30);
  insert into s1 (num, email, no) values (400, 'xxx2', null);

  insert into s1 (num, email, no) values (500, 'xxx5', 40);  --����
  
  
--FK �ǽ�
--master ���̺� ����
create table m2 
( no NUMBER(2) constraint m2_no_pk PRIMARY KEY,
  name VARCHAR2(10) );
  
insert into m2 (no, name) values (10, 'aa');
insert into m2 (no, name) values (20, 'bb');
insert into m2 (no, name) values (30, 'cc');
commit;

select *
from m2;

--slave ���̺�
create table s2
( num NUMBER(4) CONSTRAINT s2_num_pk PRIMARY KEY,
  email VARCHAR2(20),
  no NUMBER(2),  
   -- FK �۾�
  CONSTRAINT s2_no_fk FOREIGN KEY(no) REFERENCE m2(no)
  );
  
  insert into s2 (num, email, no) values (100, 'jjj', 10);
  insert into s2 (num, email, no) values (200, 'xxx', 20);
  insert into s2 (num, email, no) values (300, 'ttt', 30);
  insert into s2 (num, email, no) values (400, 'xxx2', null);

  insert into s2 (num, email, no) values (500, 'xxx5', 40);  --����
  
--##########################################################
--1. FK�̽�: slave�� �����ϴ� master�� ���� ������ �� ����
delete from m1
where no = 10;

--ON DELETE CASCADE
create table m3 
( no NUMBER(2) constraint m3_no_pk PRIMARY KEY,
  name VARCHAR2(10) );
  
insert into m3 (no, name) values (10, 'aa');
insert into m3 (no, name) values (20, 'bb');
insert into m3 (no, name) values (30, 'cc');
commit;


--slave ���̺�
create table s3
( num NUMBER(4) CONSTRAINT s3_num_pk PRIMARY KEY,
  email VARCHAR2(20),
  -- FK �۾�
  no NUMBER(2) CONSTRAINT s3_no_fk REFERENCES m3(no) ON DELETE CASCADE
  );
  
  insert into s3 (num, email, no) values (100, 'jjj', 10);
  insert into s3 (num, email, no) values (200, 'xxx', 20);
  insert into s3 (num, email, no) values (300, 'ttt', 30);
  insert into s3 (num, email, no) values (400, 'xxx2', null);
  COMMIT;
  
  select *
  from m3;
  
  select *
  from s3;
  
  delete from m3 
  where no = 10;
  
  --ON DELETE SET NULL
  --master ���̺� ����
create table m4
( no NUMBER(2) constraint m4_no_pk PRIMARY KEY,
  name VARCHAR2(10) );
  
insert into m4 (no, name) values (10, 'aa');
insert into m4 (no, name) values (20, 'bb');
insert into m4 (no, name) values (30, 'cc');
commit;

--slave ���̺�
create table s4
( num NUMBER(4) CONSTRAINT s4_num_pk PRIMARY KEY,
  email VARCHAR2(20),
  -- FK �۾�
  no NUMBER(2) CONSTRAINT s4_no_fk REFERENCES m4(no) ON DELETE SET NULL
  );
  
  insert into s4 (num, email, no) values (100, 'jjj', 10);
  insert into s4 (num, email, no) values (200, 'xxx', 20);
  insert into s4 (num, email, no) values (300, 'ttt', 30);
  insert into s4 (num, email, no) values (400, 'xxx2', null);
  COMMIT;

  select *
  from m4;
  
  select *
  from s4;
  
  delete from m4
  where no = 10;
  
  --���̺� ����
  drop table mydept;
  drop table mydept10;
  
  
  --m1�� s2 �������� Ȯ��
  select *
  from user_constraints
  where table_name = 'M1';
  
  drop table m1 cascade constraints;
