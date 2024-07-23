/*
    Author : sseung
    Date : 2024.07.22
    Objective : Basic SELECT
    Environment : MacOs 14.5, DataGrip 2024.1.4 빌드 #DB-241.17890.24
 */

SELECT concat(ename, '의 봉급은', sal, '입니다')
FROM emp;

SELECT distinct deptno
FROM emp;

SELECT *
FROM emp
WHERE ename = UPPER('smith');

-- 1980년 입사한 직원
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate >= '1980-01-01' AND hiredate <+ '1980-12-31';


SELECT ename, sal, comm, sal + IFNULL(comm, 0)
FROM emp
where ename = 'SMITH';

SELECT *
FROM emp;

SELECT empno 사원번호, ename 이름, (sal + IFNULL(comm, 0)) * 12 AS "Annual Salary"
FROM emp;

SELECT version();
-- 1987년에 입사한 사원의 이름과 봉급과 입사날짜를 출력하시오.
SELECT ename, sal, hiredate
FROM emp
WHERE hiredate LIKE '1987%';
# WHERE hiredate BETWEEN '1987-01-01' AND '1987-12-31';
-- WHERE hiredate <= '1987-12-31' AND '1987-01-01' >= hiredate;

-- 우리 회사 직원중에서 직무가 회사원이거나 분석가인 사원의 사원이름, 사원의 직무를 출력하시오.
select * from dept;
SELECT ename, job
FROM emp
WHERE job IN('CLERK', 'ANALYST'); -- job = 'CLERK' or job = 'ANALYST'

SELECT ename
FROM emp
WHERE ename LIKE '%T';

-- 우리 회사 직원 중에 보너스를 받는 사람은?
SELECT empno, ename, comm
FROM emp
WHERE comm IS NOT NULL;

-- 입사일 기준 내림차순
SELECT empno, ename, hiredate, sal
FROM emp
ORDER BY hiredate DESC, sal ASC;

-- 부서번호가 20번 또는 30번인 부서의 연봉 내림차순
SELECT deptno, ename, (sal + IFNULL(comm, 0)) * 12 AS '연봉'
FROM emp
WHERE deptno in(20, 30)
ORDER BY sal*12 DESC;
