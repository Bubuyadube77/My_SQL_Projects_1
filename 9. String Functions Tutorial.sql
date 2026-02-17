-- String functions

select length('Skyfall') as len;

select first_name, length(first_name) as len
from employee_demographics
order by len
;

select upper('sky');
select lower('sky');

select first_name, upper(first_name)
from employee_demographics
;

select first_name, lower(first_name)
from employee_demographics
;

select trim('    sky ');
select ltrim('    sky   ');
select rtrim('    sky   ');

select first_name, 
left(first_name, 4) as lefta,
right(first_name, 4) as righta,
substring(first_name, 3, 2),
birth_date,
substring(birth_date, 6, 2) as birth_month
from employee_demographics;

select first_name, replace(first_name, 'Mark', 'Eze')
from employee_demographics;

select locate('x', 'Alexander');

select *, 
locate('Andy', first_name)
from employee_demographics;

select first_name, last_name, 
concat(first_name, ' ', last_name) as full_name
from employee_demographics;
