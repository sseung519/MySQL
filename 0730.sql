CREATE TABLE mycompany.patient(
    number          TINYINT NOT NULL,
    code            CHAR(2) NOT NULL,
    days            SMALLINT NOT NULL,
    age             TINYINT NOT NULL,
    dept            VARCHAR(20),
    operfee         INT,
    hospitalfee     INT,
    money           INT,
    CONSTRAINT patient_number_pk PRIMARY KEY(number)
);

CREATE VIEW mycompany.empview10
AS
SELECT empno, ename, job
FROM emp
WHERE deptno = 10;

select * from empview10;

CREATE VIEW bbb
AS
SELECT emp.empno, ename, dname, loc
FROM emp join dept ON(emp.deptno = dept.deptno)
WHERE dept.deptno = 30;

CREATE VIEW EMP_30_VU
AS
SELECT empno, ename, sal, deptno
from emp
WHERE deptno = 30;

INSERT INTO EMP_30_VU
VALUES(1111, 'sseung', 500, 30);

SELECT * FROM EMP;

CREATE OR REPLACE VIEW emp_20
AS
SELECT * FROM emp
WHERE deptno = 30;

update emp_20
set deptno =30
where empno = 7369;

show index from emp;
create index i_emp_ename on emp(ename);

select * from patient;