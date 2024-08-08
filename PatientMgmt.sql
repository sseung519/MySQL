DELIMITER $$
CREATE PROCEDURE sp_select_all_patient()
BEGIN
    select number, dept, operfee, hospitalfee, money
    FROM patient
    ORDER BY number desc;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE sp_select_one_patient
    (
        IN v_number tinyint
    )
BEGIN
    select *
    from patient
    where number = v_number;
END $$
DELIMITER ;

call sp_select_one_patient(33);

DELIMITER $$
create PROCEDURE sp_update_patient
(
    IN v_number tinyint,
    IN v_code char(2),
    IN v_days smallint,
    In v_age tinyint,
    IN v_dept varchar(20),
    IN v_operfee int,
    IN v_hospitalfee int,
    IN v_money int
)
BEGIN
    UPDATE patient
    SET code = v_code, days = v_days, age = v_age, dept = v_dept,
        operfee = v_operfee, hospitalfee = v_hospitalfee, money = v_money
    WHERE NUMBER = v_number;
END $$
DELIMITER ;
