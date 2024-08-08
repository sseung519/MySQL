select user();
create user 'sseung'@'%' identified by 'root1234';

desc mysql.user;

select * from mysql.user;

grant select on mycompany.emp to 'sseung'@'%';
grant insert on mycompany.* to 'sseung'@'%'; #mycompany에 있는 모든 table select 권한 부여
FLUSH PRIVILEGES ;

GRANT ALL PRIVILEGES ON mycompany.patient TO 'sseung'@'%';
FLUSH PRIVILEGES ;

GRANT ALL PRIVILEGES ON mycompany.* TO 'sseung'@'%';
FLUSH PRIVILEGES ;

SHOW GRANTS FOR 'sseung'@'%';

REVOKE ALL PRIVILEGES ON mycompany.* FROM 'sseung'@'%';
FLUSH PRIVILEGES ;
select * from emp;

select*from member;
