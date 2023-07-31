
CREATE TABLE subject
( subtno NUMBER(5) CONSTRAINT subject_subtno_pk PRIMARY KEY,
 subname VARCHAR2(20) CONSTRAINT subject_subname_nn NOT NULL,
 term VARCHAR2(1),
 CONSTRAINT subject_term_ck CHECK( term IN('1','2')),
 type VARCHAR2(4),
 CONSTRAINT subject_type_ck CHECK( type IN('필수','선택')) );
 
 create table student
( studno number(5) constraint student_studno_pk PRIMARY KEY,
stuname varchar2(10) );

create table sugang
( studno NUMBER(5) CONSTRAINT sugang_studno_fk REFERENCES student(studno),
  subno NUMBER(5) CONSTRAINT sugang_subno_fk REFERENCES subject(subno),
  regdate date,
  result NUMBER(3),
  CONSTRAINT sugang_studno_Pk PRIMARY KEY(studno,subno) );
 