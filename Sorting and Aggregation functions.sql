-- List all the produst names and their avilable stock for all products that we have in stock from the smallest quataty avilable?
SELECT 
  productname
, unitsinstock
FROM Products
where unitsinstock > 0
order by 2

-- List all sales for product 20 ordered by the quantity orded and discount made from highist to lowest?
select *
, discount * 100 as discountperc
from [Order Details]
where productid = 20
order by  quantity, discount DESC

-- List all sales for product 38 ordered by the total price from highist to lowest?
select *
, unitprice * quantity * (1-discount) as total_sales
from [Order Details]
where productid = 38
order by  2 desc 

-- List all empoyees first name, title and age order it based on their age from the youngest?
select 
  firstname
, title
, date('2024-03-02') - birthdate AS Age
from Employees
order by Age 

-- What is the average age or the employees?
select ROUND(AVG(date('2024-03-02') - birthdate),2) as average_age
from Employees

-- how many times we sold the product 20? and what was the max order quantity?
SELECT 
  count(*) as No_of_sales
, MAX(quantity) as Max_quantity
from [Order Details]
where productid = 20

-- how many products we have sold?
SELECT 
  count(DISTINCT(productid)) as No_of_products
from [Order Details]

-- total number of units sold for product 15? and their total sales price?
SELECT
  SUM(quantity) as Total_quantity
, SUM(unitprice * quantity * (1-discount) )AS Total_sales
from [Order Details]
where productid = 15

-- list number of orders per product from the most sold?
select 
   productid
,  count(*) No_of_orders
from [Order Details]
group by 1
order by 2 desc 

-- count the number of products per supplier?
select 
  supplierid AS supplier_id
, count(productid) as No_of_products
FROM Products
group by 1
order by 1

-- Count number of orders each employee made for each ship country?
SELECT
  shipcountry AS ship_country
, count(orderid) as No_of_orders
, employeeid
FROM Orders
GROUP BY 3, 1

-- Count number of orders each employee made for each ship country outside the USA?
SELECT
  shipcountry AS ship_country
, count(orderid) as No_of_orders
, employeeid
FROM Orders
where shipcountry != "USA"
GROUP BY 3, 1

-- How many orders where shipped after the required date?
select count(*) as No_Of_lated_orders
from Orders
where shippeddate > requireddate

-- What is the employee ID who delayed "shipped order after the required date" the most numbers of orders? 
-- and what is the number of orders delayed by him?
select 
  employeeid
, count(*) as lated_orders
from Orders
where shippeddate > requireddate
group by 1
order by 2 desc

--Show the total quantity ordered per product, How many products for which the quantity ordered is fewer than 200,000?
SELECT
  productid
, sum(quantity) as Total_Quantity
from "Order Details"
GROUP by 1
having sum(quantity) < 200000
order by 1

--If I increased all products in category 3 by 20%, what would be the most expensive product in this category? 
--and what it it's new price?
select 
  productid
, unitprice
, unitprice * 1.2 as new_price
from Products
where categoryid = 3
order by 3 desc

-- What is the name of the customer who ordered exactly 175 order? 
--if multiple choose the last name from an alphabetical order.
SELECT
  customerid
, count(orderid) as No_Of_Orders
from Orders
group by 1
having count(orderid) = 175
order by 1 desc





