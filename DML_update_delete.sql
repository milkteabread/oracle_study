
--update��
select *
from mydept;

UPDATE mydept
SET dname='����',loc='���' WHERE deptno = 50;
commit;

UPDATE mydept
SET dname='����',loc='���';

rollback;

UPDATE mydept
SET dname= ( SELECT dname
            FROM dept
            WHERE deptno = 10),
    loc= ( SELECT loc
           FROM dept
          WHERE deptno=20)
WHERE deptno = 60;


--delete
DELETE FROM mydept
WHERE deptno = 50;
commit;
DELETE FROM mydept;
rollback;

DELETE 
FROM mydept
WHERE loc = (SELECT loc
 FROM dept
 WHERE deptno = 20);