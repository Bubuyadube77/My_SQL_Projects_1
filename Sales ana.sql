select *
from sales;

create table sales1
like sales;

select*
from sales1;

insert sales1
select*
from sales;

select *,
row_number() over(partition by `Date`, `Day`, `Month`, Customer_Age, Age_Group, Customer_Gender, Country, State, Product_Category, Sub_Category,Product, Order_Quantity, Unit_Cost, Unit_Price, Profit, Cost, Revenue) as row_num
from sales1;

with Duplicate_cte as
(
select *,
row_number() over(partition by `Date`, `Day`, `Month`, Customer_Age, Age_Group, Customer_Gender, Country, State, Product_Category, Sub_Category,Product, Order_Quantity, Unit_Cost, Unit_Price, Profit, Cost, Revenue) as row_num
from sales1
)
select*
from Duplicate_cte
where row_num > 1;

 CREATE TABLE `sales2` (
  `Date` text,
  `Day` int DEFAULT NULL,
  `Month` text,
  `Year` int DEFAULT NULL,
  `Customer_Age` int DEFAULT NULL,
  `Age_Group` text,
  `Customer_Gender` text,
  `Country` text,
  `State` text,
  `Product_Category` text,
  `Sub_Category` text,
  `Product` text,
  `Order_Quantity` int DEFAULT NULL,
  `Unit_Cost` int DEFAULT NULL,
  `Unit_Price` int DEFAULT NULL,
  `Profit` int DEFAULT NULL,
  `Cost` int DEFAULT NULL,
  `Revenue` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from sales2;

insert sales2
select *,
row_number() over(partition by `Date`, `Day`, `Month`, Customer_Age, Age_Group, Customer_Gender, Country, State, Product_Category, Sub_Category,Product, Order_Quantity, Unit_Cost, Unit_Price, Profit, Cost, Revenue) as row_num
from sales1;

select*
from sales2
where row_num > 1;

delete
from sales2
where row_num > 1;

select*
from sales2;

select count(product_category)
from sales2;

select distinct `Month`
from sales2;

select distinct Customer_Gender
from sales2;

select distinct Country
from sales2;

select distinct State
from sales2
order by State asc;

select `date`
from sales2;

select*
from sales2;

select*
from sales2
where Order_Quantity is null
or Order_Quantity = '';





