SHOW DATABASES;
USE classicmodels;
SHOW tables;
SELECT * FROM customers;
SELECT customernumber , customername FROM customers;
SELECT * FROM customers limit 7;
SELECT customernumber , customername from customers limit 7;
SELECT * FROM customers where country = 'USA' OR country = 'France' or country = 'Germany';
SELECT customername , country FROM customers WHERE country in ('USA' , 'France' , 'Germany');
SELECT * FROM customers where customernumber = 103 or customernumber = 112;
SELECT * FROM customers WHERE country = 'USA' AND creditlimit between 100000 and 150000;
SELECT * FROM customers WHERE country = 'USA' AND creditlimit >= 100000 and creditlimit <=150000;
SELECT * FROM customers where creditlimit < 100000;
SELECT contactfirstname , contactlastname , concat(contactfirstname , contactlastname) , country from customers;
SELECT concat(contactfirstname , contactlastname) , country from customers;
SELECT * FROM customers;
SELECT * FROM customers WHERE state is null;
SELECT * FROM customers WHERE state is null and postalcode is null;
SELECT * FROM customers WHERE state is null or postalcode is null;
SELECT * FROM customers WHERE creditlimit > 100000;
SELECT * FROM customers where country = 'USA' and creditlimit > 100000;
SELECT * FROM customers where  creditlimit > 100000 and creditlimit < 1500000;
SELECT * FROM customers WHERE  creditlimit < 100000;
SELECT contactfirstname as First_Name , contactlastname  as Last_Name , concat(contactfirstname , contactlastname) as Full_Name , country from customers;
SELECT concat(contactfirstname , contactlastname) AS Full_Name , country from customers;
SELECT * FROM customers where customerName like '%a%';
SELECT * FROM customers where customerName like '%z%';
SELECT * FROM customers where customerName like '%z_';
SELECT * FROM customers where customerName like '%a_';
SELECT * FROM customers where customerName like '%ltd';
SELECT * FROM customers where customerName like '%co';
SELECT * FROM customers where customerName like '%co.';
SELECT * FROM customers where customerName like '%ltd.';

SELECT * FROM customers where customerName like '%gift%';
SELECT * FROM customers where customerName like '%gift%';

SELECT * FROM customers order by Creditlimit asc;
SELECT * FROM customers order by Creditlimit desc;
SELECT * FROM customers order by contactlastname desc;
SELECT * FROM customers order by contactlastname asc;
SELECT * FROM customers order by country asc;
SELECT state ,  country from customers order by country asc , state asc;
SELECT state ,  country from customers order by state asc , country asc;

SELECT distinct country from customers order by country;
select country from customers order by country;

SELECT state , country from customers order by country;
SELECT distinct state ,  country  from customers order by country;

SELECT  COUNT(country) as cnt from customers;
SELECT  COUNT(distinct country) as cnt from customers;

SELECT min(creditlimit) as Min_cred from customers;
SELECT max(creditlimit) as Mix_cred from customers;
SELECT 
  MIN(creditlimit) AS Min_cred,
  MAX(creditlimit) AS Max_cred,
  AVG(creditlimit) AS Avg_cred,
  SUM(creditlimit) AS Sum_cred,
  COUNT(creditlimit) AS Count_cred
FROM customers;

SELECT * FROM customers;

SELECT country , count(customernumber) as cnt
FROM customers
group by country
having cnt > 10
order by cnt;

SELECT country , count(customernumber) as cnt
FROM customers
where  country in ('USA' , 'France' , 'Poland')
group by country
having cnt > 10
order by cnt;

SELECT * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
SELECT distinct country from customers where country in (select distinct country from employees);
select distinct ordernumber from orders where ordernumber in (select distinct ordernumber from orderdetails);

SELECT a.customernumber, a.country, b.ordernumber, b.status
FROM customers a
INNER JOIN orders b
ON a.customernumber = b.customernumber
ORDER BY b.customernumber;

select distinct status from orders;

select a.customernumber , a.country , b.ordernumber ,  b.status
from customers a
right join orders b
on a.customernumber = b.customernumber
where b.status = "Disputed";

select a.customernumber , a.country , b.ordernumber ,  b.status
from customers a
right join orders b
on a.customernumber = b.customernumber
order by a.customernumber;

select a.customernumber , a.country , b.ordernumber ,  b.status
from customers a
right join orders b
on a.customernumber = b.customernumber
where b.status = "Disputed"
and a.country not in ("Spain");

select * FROM orderdetails;
select *from orders;
select *  from customers;

SELECT a.customernumber, a.country, a.customername, a.phone, 
       b.ordernumber, b.status, c.productcode
FROM customers a
LEFT JOIN orders b
  ON a.customernumber = b.customernumber
LEFT JOIN orderdetails c
  ON b.ordernumber = c.ordernumber;

select distinct state from customers
union all
select distinct state from offices
order by state;


