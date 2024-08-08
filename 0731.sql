DELIMITER //
CREATE PROCEDURE sp_test
(
    OUT v_now datetime,
    OUT v_version varchar(30)
)
BEGIN
    SELECT NOW(), VERSION() into v_now, v_version;
END
//
DELIMITER ;

CALL sp_test(@t_now, @t_version);
SELECT @t_now, @t_version;

create table dept_clone
as
select * from dept;

DELIMITER //
create PROCEDURE sp_deleteDept()
BEGIN
    DELETE FROM dept_clone;
END
//
DELIMITER ;

call sp_deleteDept();

DELIMITER $$
CREATE PROCEDURE sp_insertDept
    (
        IN v_deptno tinyint,
        IN v_dname varchar(14),
        IN v_loc varchar(13)
    )
BEGIN
    INSERT INTO dept_clone(deptno, dname, loc)
    VALUES(v_deptno, v_dname, v_loc);
    commit;
END
$$
DELIMITER ;

call sp_insertDept(50, 'Design', 'Seoul');

select*from dept_clone;

/* 사원번호를 입력받아서 부서이름과 부서위치를 출력하시오 */
DELIMITER $$
CREATE PROCEDURE sp_selectEmp
    (
        IN v_empno smallint,
        OUT v_dname varchar(14),
        OUT v_loc varchar(13)
    )
BEGIN
    select dname, loc INTO v_dname, v_loc
    from emp join dept on(emp.deptno = dept.deptno)
    where empno = v_empno;
END
$$
DELIMITER ;

CALL sp_selectEmp(7369, @t_dname,@t_loc);
SELECT @t_dname, @t_loc;

DELIMITER $$
CREATE PROCEDURE sp_selectDname
    (
        INOUT v_name varchar(14)
    )
BEGIN
    DECLARE v_str varchar(14); # begin과 end 사이 declare(변수 선언 inout에 사용)
    SELECT loc INTO v_str
    FROM dept
    WHERE dname = v_name;
    SET v_name = v_str;
END $$
DELIMITER ;

set @T_STR := 'RESEARCH';
CALL sp_selectDname(@t_str);
select@t_str;

/* 부서번호로 소속사원의 사원 번호, 사원명, 부서명, 부서위치 */
DELIMITER $$
CREATE PROCEDURE sp_select_emp_dept
    (
        IN v_deptno tinyint
    )
BEGIN
    SELECT empno, ename, dname, loc, dept.deptno
    FROM emp natural join dept
    WHERE deptno = v_deptno;
END $$
DELIMITER ;

CALL sp_select_emp_dept(30);