-- stored procedures

create procedure large_salary()
select*
from employee_salary
where salary >= 50000;

call large_salary();


Delimiter $$
create procedure large_salaries5()
Begin
	select*
	from employee_salary
	where salary >= 50000;
    select*
	from employee_salary
	where salary >= 10000;
End $$ 
Delimiter ;

call large_salaries5()

Delimiter $$
create procedure large_salaries6()
Begin
	select*
	from employee_salary
	where salary >= 50000;
    select*
	from employee_salary
	where salary >= 10000;
End $$ 
Delimiter ;

call large_salaries6()

Delimiter $$
create procedure large_salaries8(a_id int)
Begin
	select salary
	from employee_salary
	where employee_id = a_id;
End $$ 
Delimiter ;

call large_salaries8(1)