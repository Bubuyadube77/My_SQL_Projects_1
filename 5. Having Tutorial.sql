select gender, avg(age)
from employee_demographics
group by gender
having avg(age) > 40
;

select occupation, avg(salary)
from employee_salary
group by occupation
having avg(salary) > 40000
;

select occupation, avg(salary)
from employee_salary
where occupation like '%manag%'
group by occupation
having avg(salary) > 55000
;