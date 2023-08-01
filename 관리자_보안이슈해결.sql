--scott에게 권한 할당
GRANT create view 
TO scott;

show user;

select *
from scott.emp;  --보안이슈 => 해결: 별칭

create synonym s_emp
for scott.emp;

select *
from s_emp;  --보안 이슈 해결

drop synonym s_emp;
