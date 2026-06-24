
-- Solving EDA Questions using PostgreSQL
 
1. Total Sales
2. REVENUE BY COUNTRY
3. TOP 10 BEST-SELLING PRODUCTS (by units sold)
4. Top 10 Customer by Sales
5. Top weekly days by revenue
6. Top weekly days by Quantity
7. Hourly Sales trend by Revenue
8. Sales trends over months

  
   
   


CREATE TABLE Rajmandir(
    invoice VARCHAR(50),
    stockcode VARCHAR(50),
    description TEXT,
    quantity INTEGER,
    invoicedate TIMESTAMP,
    price NUMERIC(10,2),
    customer_id BIGINT,
    country VARCHAR(100),
    total_price NUMERIC(12,2),
    order_month INTEGER,
    dayofweek VARCHAR(20),
    hour INTEGER
);

select * from Rajmandir


-- Q1 — REVENUE BY COUNTRY

select country,SUM(total_price) as Total_Sales
from Rajmandir
group by country
order by SUM(total_price) desc
limit 10;


-- Q2 — TOP 10 BEST-SELLING PRODUCTS (by units sold)

select DISTINCT description , COUNT(quantity) as Total_Quantity
from Rajmandir
group by description
order by COUNT(quantity) desc
limit 10

-- Q3. Top 10 Customer by Sales

select DISTINCT customer_id,SUM(total_price) as Total_Sales
from Rajmandir
group by customer_id
order by SUM(total_price) desc
limit 10;


-- Q4. Top weekly days by revenue
select DISTINCT dayofweek , SUM(total_price) as Total_sales
from Rajmandir
group by dayofweek
order by SUM(total_price) desc;


-- Q5. Top weekly days by Quantity
select DISTINCT dayofweek , SUM(quantity) as Total_sales_Q
from Rajmandir
group by dayofweek
order by SUM(quantity) desc;


-- Q6. Hourly Sales trend by Revenue
select hour, SUM(total_price) as Total_sales
from Rajmandir
group by hour
order by SUM(total_price) desc


-- Q7. Monthly Sales Trend
select order_month, SUM(total_price) as Total_sales
from Rajmandir
group by order_month
order by SUM(total_price) desc


-- Q8. Total Sales 
select sum(total_price) as total_sales from Rajmandir
