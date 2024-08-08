# create table patient(
#     number      int primary key,
#     code        varchar(45) not null,
#     days        int not null,
#     age         int not null,
#     dept        varchar(45),
#     operfee     int,
#     hospitalfee int,
#     money       int
# );
# select * from patient;

start transaction;

select *
from emp
where empno = 7782;

update emp
set deptno = 30
where empno = 7782;

savepoint aaa;

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7999, 'TOM', 'SALESMAN', 7782, CURDATE(), 2000, 2000, 10);

ROLLBACK to aaa;
select *
from emp;

create table emp20
as
select empno, ename, sal
from emp
where deptno = 20;
select *
from emp20;

drop table emp20;

alter table emp20
    add age tinyint after ename;

alter table emp20
    drop column sal;

alter table emp20
    modify ename varchar(20);

CREATE TABLE Jusorok
(
    bunho  SMALLINT,
    gender CHAR(6) DEFAULT 'male'
);

insert into Jusorok
values (1, 'FEMALE');
insert into Jusorok
values (2, default);
select *
from Jusorok;

CREATE TABLE dept
(
    deptno TINYINT(2),
    dname  VARCHAR(14),
    loc    VARCHAR(13)
);

ALTER TABLE dept
    ADD CONSTRAINT pk_dept PRIMARY KEY (deptno);

CREATE TABLE emp
(
    empno    SMALLINT(4),
    ename    VARCHAR(10),
    job      VARCHAR(9),
    mgr      SMALLINT(4),
    hiredate DATE,
    sal      FLOAT(7, 2),
    comm     FLOAT(7, 2),
    deptno   TINYINT(2)
);

ALTER TABLE emp
    ADD CONSTRAINT pk_emp PRIMARY KEY (empno),
    ADD CONSTRAINT fk_deptno FOREIGN KEY (deptno)
        REFERENCES dept (deptno);

INSERT INTO dept
VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept
VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept
VALUES (30, 'salES', 'CHICAGO');
INSERT INTO dept
VALUES (40, 'OPERATIONS', 'BOSTON');
INSERT INTO emp
VALUES (7369, 'SMITH', 'CLERK', 7902, CAST('1980-12-17' AS DATE), 800, NULL, 20);
INSERT INTO emp
VALUES (7499, 'ALLEN', 'salESMAN', 7698, CAST('1981-2-20' AS DATE), 1600, 300, 30);
INSERT INTO emp
VALUES (7521, 'WARD', 'salESMAN', 7698, CAST('1981-2-22' AS DATE), 1250, 500, 30);
INSERT INTO emp
VALUES (7566, 'JONES', 'MANAGER', 7839, CAST('1981-4-2' AS DATE), 2975, NULL, 20);
INSERT INTO emp
VALUES (7654, 'MARTIN', 'salESMAN', 7698, CAST('1981-9-28' AS DATE), 1250, 1400, 30);
INSERT INTO emp
VALUES (7698, 'BLAKE', 'MANAGER', 7839, CAST('1981-5-1' AS DATE), 2850, NULL, 30);
INSERT INTO emp
VALUES (7782, 'CLARK', 'MANAGER', 7839, CAST('1981-6-9' AS DATE), 2450, NULL, 10);
INSERT INTO emp
VALUES (7788, 'SCOTT', 'ANALYST', 7566, CAST('1987-7-13' AS DATE), 3000, NULL, 20);
INSERT INTO emp
VALUES (7839, 'KING', 'PRESIDENT', NULL, CAST('1981-11-17' AS DATE), 5000, NULL, 10);
INSERT INTO emp
VALUES (7844, 'TURNER', 'salESMAN', 7698, CAST('1981-9-8' AS DATE), 1500, 0, 30);
INSERT INTO emp
VALUES (7876, 'ADAMS', 'CLERK', 7788, CAST('1987-7-13' AS DATE), 1100, NULL, 20);
INSERT INTO emp
VALUES (7900, 'JAMES', 'CLERK', 7698, CAST('1981-12-3' AS DATE), 950, NULL, 30);
INSERT INTO emp
VALUES (7902, 'FORD', 'ANALYST', 7566, CAST('1981-12-3' AS DATE), 3000, NULL, 20);
INSERT INTO emp
VALUES (7934, 'MILLER', 'CLERK', 7782, CAST('1982-1-23' AS DATE), 1300, NULL, 10);

CREATE TABLE salgrade
(
    grade TINYINT(1),
    losal SMALLINT(4),
    hisal SMALLINT(4)
);
INSERT INTO salgrade
VALUES (1, 700, 1200);
INSERT INTO salgrade
VALUES (2, 1201, 1400);
INSERT INTO salgrade
VALUES (3, 1401, 2000);
INSERT INTO salgrade
VALUES (4, 2001, 3000);
INSERT INTO salgrade
VALUES (5, 3001, 9999);

commit;

create table student(
    hakbun char(4),
    name   varchar(20) not null,
    kor    tinyint     not null check(kor between 0 and 100),
    eng    tinyint     not null,
    mat    tinyint     not null default 0,
    edp    tinyint,
    tot    smallint,
    avg    float(5, 2),
    grade  char(1),
    deptno tinyint,
    constraint student_hakbun_pk primary key (hakbun),
    constraint student_name_uk UNIQUE (name),
    constraint student_grade_ck check (grade in ('A', 'B', 'C', 'D', 'F')),
    constraint student_deptno_fk FOREIGN KEY(deptno) references dept(deptno)
) default charset utf8;

#제약조건 수정 modify
alter table student
modify edp tinyint not null;

#제약조건 추가 add
alter table student
add constraint student_tot_ck check(tot between 0 and 400);

alter table student
modify eng tinyint;
