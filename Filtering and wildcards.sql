-- Retrieve all data
SELECT *
from Orders
1.	Filtering
•	Basic Filtering
  
-- Is there a product that costs more than 100 USD?
select *
from Products
where unitprice > 100
  
-- Is there a product that costs 50 USD or more?
select *
from Products
where unitprice >=50
  
-- What is the price of Tofu?
select
unitprice as Price
from Products
where productname = 'Tofu'
  
-- What are the products that are out of stock?
select *
from Products
where unitsinstock = 0

-- What are the products that are in the med price category? price categories are : low (0:10), med (10:50), high (50:~)
SELECT *
from Products
where unitprice BETWEEN 10 and 50
  
-- Is there customers without country information?
select *
from Customers
where country is NULL
  
-- Is there are any customers based outside the USA?
SELECT *
from Customers
where country != 'USA'
  
-- List all the countries where the customer resides outside the USA.
SELECT DISTINCT country
from Customers
where country != 'USA'


•	Advanced Filtering
-- We are expanding in the German market outside Berlin and wants to see if they have clients there to collect their feedback?
Select *
FROM Customers
where city != "Berlin"
and country = "Germany"
  
-- What are the product names that is managed by suppliers 15, 12, 20, 1?
SELECT productname
from Products
where supplierid IN (15,12,20,1)
  
-- What are the product names that is managed by suppliers 15, 12 and in category 1, 6?
SELECT productname
from Products
where supplierid IN (15,12)
and categoryid IN (1, 6)
  
-- Do we have clients in Lisboa or Sevilla?
select *
from Customers
where city = 'Lisboa'
or city = 'Sevilla'
  
-- Who are the clients that the either based on the USA or UK and their title is the Owner?
select *
from Customers
WHERE (country = 'USA'
Or country = 'UK')
and contacttitle = 'Owner'
  
-- Who are the clients whose title is the Owner and based outside the USA?
select *
from Customers
WHERE NOT country = 'USA'
and contacttitle = 'Owner'

  
2-	Wildcards
-- Who are the clients that whose their title is related to sales?
select *
from Customers
WHERE contacttitle LIKE '%sales%'
  
-- Who are the customer's company and country who are based in Europe?
SELECT companyname, address, country, Region
FROM Customers
where region like '%Europe'
  
-- There was a supplier whose name was something like Guy and based in Canada, could you get his information?
SELECT *
FROM Suppliers
where contactname LIKE '%Guy%'
and country = 'Canada'

-- Q1: What is the category ID for Meat & Poultry?
SELECT categoryid 
FROM Categories
WHERE categoryname = "Meat/Poultry"

-- Q2: What is the name of the most expensive product that it out of stock in the “Meat” category ?
select productname
from Products
where categoryid=6
and unitsinstock = 0

-- Q3: For this product in the previous question , what are the order IDs when it was sold with 25% discount with quantity over 50?
select orderid
from "Order Details"
where productid = 29
and discount = 0.25
and quantity >= 50

-- Q4: What is the most common title for the employees that are based in USA or UK and their title of courtesy are "Dr."?
select title
from Employees
where country in ("USA", "UK") and titleofcourtesy = "Dr."
  
-- Q5: Some shipments returned as the address wasn't clear. It was being shipped to a country inside America and to a street have "rue" in it's name. 
SELECT *
from Customers
where address LIKE "%rue%"
and region LIKE "%America"
