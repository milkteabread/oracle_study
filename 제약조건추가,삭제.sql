CREATE TABLE emp04
AS
SELECT * FROM emp;

ALTER TABLE emp04
ADD ( email VARCHAR2(10) , address VARCHAR2(20) );

ALTER TABLE emp04
MODIFY ( email VARCHAR2(40) );

ALTER TABLE emp04
DROP ( email );

desc emp04;

select *
from emp04;

CREATE TABLE dept03
( deptno NUMBER(2),
 dname VARCHAR2(15),
 loc VARCHAR2(15)
);

--���߿� �������� �߰�
alter table dept03
add constraint dept03_deptno_pk primary key(deptno);

alter table dept03
add constraint dept03_loc_uk unique(loc);

--null ==> not null (�����۾�)
ALTER TABLE dept03
MODIFY ( dname VARCHAR2(15) CONSTRAINT dept03_dname_nn NOT NULL );

--PK ����
alter table dept03
drop primary key;

--UNOQUE ����
alter table dept03
drop unique(loc);

--not null ����
alter table dept03
drop CONSTRAINT dept03_dname_nn;

--################################
select *
from user_constraints
where table_name = 'M2';

select *
from user_constraints
where table_name = 'S2';

--M2�� PK ����
alter table m2
drop primary key cascade;


