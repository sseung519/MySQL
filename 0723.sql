/*

 */
SELECT ename, LENGTH(ename) #AVG(sal), SUM(sal), MAX(sal), MIN(sal)
FROM emp
WHERE deptno = 20;
# 전자(AVG)는 comm을 받는 사람만 평균, 후자(AVG)는 comm에 0을 넣어서 전체 사람의 평균
SELECT AVG(comm), AVG(IFNULL(comm, 0)), SUM(IFNULL(comm, 0)) / COUNT(*)
FROM emp;

#COUNT: 갯수 DISTINCT: 중복제거 = 중복을 제거한 job의 갯수
SELECT COUNT(DISTINCT job)
FROM emp;

SELECT deptno, AVG(sal), MIN(sal), MAX(sal)
FROM emp
GROUP BY deptno;

SELECT job, SUM(sal)
FROM emp
GROUP BY job;

SELECT YEAR(hiredate), COUNT(*)
FROM emp
GROUP BY YEAR(hiredate)
ORDER BY YEAR(hiredate);
/*
 부서번호(deptno)와 직무(job)별로 급여(sal)로 총합을 계산하고,
 WITH ROLLUP을 사용
 */
SELECT deptno, job, SUM(sal)
FROM emp
GROUP BY deptno, job
WITH ROLLUP;

# emp 테이블과 dept 테이블을 사용하여 **데카르트 곱 (Cartesian Product)**을 수행
SELECT emp.ename, emp.sal, dept.deptno, dept.loc
FROM emp
         CROSS JOIN dept;

SELECT ename, dept.deptno, loc
FROM dept,
     emp
WHERE dept.deptno = emp.deptno
  AND ename = 'SMITH';

SELECT loc
FROM dept
where deptno = 20;

SELECT ename, loc
FROM emp
         NATURAL JOIN dept
WHERE ename = 'SMITH';

SELECT ename, loc
FROM emp
         JOIN dept ON (emp.deptno = dept.deptno)
#          JOIN aaa on ()
#          JOIN bbb on ()
#          JOIN ccc on ()
WHERE ename = 'SMITH';

#world table
# SELECT city.name, city.Population.country.name, country.IndepYear, countrylanguage.Languge
# FROM city
#          JOIN country ON (city.countrycode = country.code)
#          JOIN countrylanguage ON (country.code = countrylanguage.countrycode)
# WHERE city.name = 'SEOUL';

SELECT ename, sal, grade
FROM  emp, salgrade
WHERE sal BETWEEN losal AND hisal
    AND ename = 'SMITH';

SELECT emp.ename, emp.empno, dept.dname, dept.loc
FROM emp RIGHT OUTER JOIN dept ON(emp.deptno = dept.deptno);

SELECT mgr
FROM emp
WHERE ename = 'SMITH'; #7902

SELECT ename
FROM emp
WHERE empno = 7902; #FORD

SELECT CONCAT(employee.ename, '의 관리자의 이름은 ',  employer.ename, '입니다')
FROM emp employee JOIN emp employer
ON employee.mgr = employer.empno;
# WHERE employer.ename = 'SMITH';

SELECT job, deptno
FROM emp
WHERE sal >= 3000
UNION
SELECT job, deptno
FROM emp
WHERE deptno = 10;

# 사번 7566의 급여보다 많이 버는 사원의 이름
SELECT sal FROM emp WHERE empno = 7566; #2975.00
SELECT ename
FROM emp
WHERE sal >(SELECT sal FROM emp WHERE empno = 2566);

# SMITH는 어디에서 근무하는가?
SELECT loc
FROM dept
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'SMITH');

# 부서에서 최소 급여를 받는 사원
IN(1300.00, 800.00, 950.00)
SELECT ename, deptno, sal
FROM emp
WHERE sal IN(SELECT MIN(SAL)
             FROM emp
             GROUP BY deptno);

