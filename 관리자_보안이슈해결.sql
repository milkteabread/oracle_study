--scott���� ���� �Ҵ�
GRANT create view 
TO scott;

show user;

select *
from scott.emp;  --�����̽� => �ذ�: ��Ī

create synonym s_emp
for scott.emp;

select *
from s_emp;  --���� �̽� �ذ�

drop synonym s_emp;
