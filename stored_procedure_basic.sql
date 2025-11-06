use learning_schema;

Create table employee_detail(
	emp_id INT primary key,
    emp_name varchar(100),
    salary decimal(10,2),
    bonus decimal(10,2)
);    

Insert into employee_detail VALUES
(1,'Anoop',30000,0),
(2,'Amit',35000,0),
(3,'Ankur',32000,0);

Delimiter //

Create procedure calc_bonus(
	IN emp_id_input INT,
    INOUT current_bonus decimal(10,2),
    OUT new_salary decimal(10,2)
)
BEGIN
	Declare base_salary DECIMAL(10,2);
    
    Select salary INTO base_salary from employee_detail where emp_id=emp_id_input;
    
    SET current_bonus=base_salary*0.10;
    
    Update employee_detail set bonus=current_bonus where emp_id=emp_id_input;
    
    SET new_salary=base_salary+current_bonus;

END//

Delimiter ;

SET @bonus=0;
SET @updated_salary=0;

call calc_bonus(2,@bonus,@updated_salary);

Select @bonus as 'Calculated bonus',@updated_salary as 'New Salary';






Delimiter //

Create procedure insert_record(
	IN emp_id_input INT,
    IN emp_name_input VARCHAR(100),
    IN salary_input Decimal(10,2),
    IN bonus_input decimal(10,2)
)
BEGIN
	INSERT INTO employee_detail VALUES
    (emp_id_input,emp_name_input,salary_input,bonus_input);
    

END//

Delimiter ;

call insert_record(4,'Ankita',40000,5000);

Select * from employee_detail;


DROP PROCEDURE IF EXISTS update_record;

Delimiter //

create procedure update_record(
	IN emp_id_input INT
)
BEGIN
	Declare base_salary DECIMAL(10,2);
    
    Select salary into base_salary from employee_detail where emp_id=emp_id_input;
    
    Update employee_detail set salary=base_salary+ 2000 where emp_id=emp_id_input;
    

END//
 
Delimiter ;

call update_record(4);
Select * from employee_detail;

Delimiter ;



