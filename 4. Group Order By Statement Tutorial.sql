select gender, avg(age), max(age), min(age), count(gender)
from employee_demographics
group by gender
;

select occupation
from employee_salary
group by occupation
;

select occupation, salary
from employee_salary
group by occupation, salary
;

select*
from employee_demographics
order by first_name asc
;

select*
from employee_demographics
order by first_name desc
;

select*
from employee_demographics
order by age asc
;

select*
from employee_demographics
order by age desc
;

select*
from employee_demographics
order by birth_date asc
;

select*
from employee_demographics
order by birth_date desc
;

select*
from employee_demographics
order by gender, age
;

select*
from employee_demographics
order by 5, 4
;