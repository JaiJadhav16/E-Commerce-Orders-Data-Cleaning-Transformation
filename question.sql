use new_order;

select * from new_order;

-- Q1 - find top 10 highest revenue generating products

select  product_id, sum(sale_price) as sales
from new_order
group by product_id
order by sales desc
limit 10;

-- with the help of above code we can find top 10 highest revenue generating products


-- Q2 - find top 5 highest selling products in each  region

with cte as(
select region,product_id, sum(sale_price) as sales
from new_order
group by region,product_id)
select * from (
select *
, row_number() over(partition by region order by sales desc) as rn
from cte) A
where rn<=5;

-- Q3 - find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023

WITH cte AS (
    SELECT 
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        SUM(sale_price) AS sales
    FROM new_order
    GROUP BY YEAR(order_date), MONTH(order_date)
)

SELECT 
    order_month,order_year,
    SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY order_month,order_year
ORDER BY order_month,order_year;

-- Q4 - for each category which month had highest sales

WITH cte AS (
    SELECT 
        category,
        DATE_FORMAT(order_date, '%Y%m') AS order_year_month,
        SUM(sale_price) AS sales
    FROM new_order
    GROUP BY category, DATE_FORMAT(order_date, '%Y%m')
)

SELECT *
FROM (
    SELECT  
        category,
        order_year_month,
        sales,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS rn
    FROM cte
) AS t
WHERE rn = 1;


