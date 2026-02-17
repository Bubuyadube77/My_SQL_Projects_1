-- Unions

select *
from employee_demographics
union
select *
from employee_salary
;

select employee_id, first_name, last_name
from employee_demographics
union
select employee_id, first_name, last_name
from employee_salary
order by employee_id asc
;

select employee_id, first_name, last_name
from employee_demographics
union all
select employee_id, first_name, last_name
from employee_salary
order by employee_id asc
;

select first_name, last_name, 'Old man' as Label
from employee_demographics
	where age > 40 and gender = 'Male'
union
select first_name, last_name, 'Old Lady' as Label
from employee_demographics
	where age > 40 and gender = 'Female'
union
select first_name, last_name, 'Highly paid' as label
from employee_salary
	where salary > 70000
order by first_name, last_name
; 