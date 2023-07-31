
--update문
select *
from mydept;

UPDATE mydept
SET dname='영업',loc='경기' WHERE deptno = 50;
commit;

UPDATE mydept
SET dname='영업',loc='경기';

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