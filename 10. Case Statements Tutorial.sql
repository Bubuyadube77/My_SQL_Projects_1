-- Case Statements

select first_name,
last_name,
age,
CASE 
	when age <= 30 then 'young'
    when age between 30 and 40 then 'middle age'
    when age >= 40 then 'old'
end as age_classification
from employee_demographics;

select first_name,
last_name,
age,
CASE 
	when age <= 30 then 'young'
    when age > 30 and age < 40 then 'middle age'
    when age >= 40 then 'old'
end as age_classification
from employee_demographics;

-- salary bonus
-- <50000 = 5%
-- >50000 = 7%
-- Finance = 10%

select salary, occupation,
case
	when salary < 50000 then salary * 1.05
	when salary >= 50000 then salary * 1.07
end as raise,
case
	when dept_id = 6 then salary * 0.1	
end as bonus
from employee_salary;