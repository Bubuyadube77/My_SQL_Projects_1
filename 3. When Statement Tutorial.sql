-- where clause

select *
from employee_salary
where first_name = 'Leslie'
;

select *
from employee_salary
;

select *
from employee_salary
where salary > 50000
;

select *
from employee_salary
where salary >= 50000
;

select *
from employee_salary
where salary < 50000
;

select *
from employee_demographics
where gender = 'male'
;

select age
from employee_demographics
;

select *
from employee_demographics
where gender = 'female'
;

select *
from employee_demographics
where birth_date > '1985-01-01'
and gender = 'male'
;

select *
from employee_demographics
where birth_date > '1985-01-01'
or gender = 'male'
;

select *
from employee_demographics
where birth_date > '1985-01-01'
or not gender = 'male'
;

select *
from employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 55
;

select *
from employee_demographics
where  age > 40
;

-- LIKE STATEMENT
-- % and _ 
select *
from employee_demographics
where first_name like 'Jer%'
;

select *
from employee_demographics
where first_name like 'a__'
;