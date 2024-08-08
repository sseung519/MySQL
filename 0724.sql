/*
Date : 07 - 24
Objective : Basic Insert
Environment : Windows 11 ,MySQL Workbench 8.0, MySQL Community Server 8.0.33
*/

use mycompany;

SELECT * FROM dept;

#INSERT
INSERT INTO dept
VALUES (50, 'Design', 'Busan');

INSERT INTO dept(deptno, dname, loc)
VALUES(60, 'Development', 'Taejeon');

#명시적 NULL
INSERT INTO dept(deptno, dname,loc)
VALUES(70, NULL, 'Inchon');

#암시적 NULL
INSERT INTO dept(deptno, loc)
VALUES(80,'Seoul');

INSERT INTO dept(dname, loc)
VALUES('Account', 'Yongin');

INSERT INTO dept(dname,loc)
VALUES(9999, 90);

INSERT INTO emp(empno, ename, hiredate, deptno)
VALUES(9998, 'jimin', CURDATE(), 80);

CREATE TABLE emp_copy
AS
SELECT empno, ename, sal, hiredate
FROM emp
WHERE deptno = 10;

CREATE TABLE emp_copy1
AS
SELECT *
FROM emp
WHERE 0 = 1;

SELECT * FROM emp_copy1;

INSERT INTO emp_copy1(empno, ename)
VALUES(0519, '씅찬');

 select version();
안녕하세요 진짜 오타가 나서 죽겟어요 하기싫어요 뭐가 문제인지 되는ㄱ ㅔ없어요
SELECT * FROM dept;

UPDATE dept
SET dname = 'FINANACE'
WHERE deptno = 70;

UPDATE dept
SET dname = 'HR', loc ='BUSAN'
WHERE deptno = 80;

CREATE TABLE STUDENT(
    hakbun char(4) primary key ,
    name varchar(20) not null ,
    kor tinyint not null ,
    eng tinyint not null ,
    mat tinyint not null ,
    edp tinyint not null ,
    tot smallint,
    avg float(5,2),
    grade char(1)
);
select * from student;

drop table student;