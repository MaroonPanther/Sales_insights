SELECT transactions.order_date, date.year
from sales.transactions
inner join sales.date ON
date.date = transactions.order_date

#YEAR ON YEAR PROFIT 
SELECT date.year,round(sum(transactions.profit_margin),2) as profit
from sales.transactions
inner join sales.date ON
date.date = transactions.order_date
GROUP BY date.year
order by round(sum(transactions.profit_margin),2) desc

#YEAR ON YEAR REVENUE 
SELECT date.year,round(sum(transactions.sales_amount),2) AS gross_revenue,round(sum(transactions.profit_margin),2) as profit,sum(transactions.sales_qty) as sales_quantity
from sales.transactions
inner join sales.date ON
date.date = transactions.order_date
GROUP BY date.year
order by round(sum(transactions.sales_amount),2) desc

select DISTINCT(currency) from sales.transactions

select * from transactions

SELECT * from sales.transactions where currency = 'usd'

#REVENUE EARNED PER CUSTOMER
select sum(sales_amount),custmer_name 
from
(select transactions.sales_amount, transactions.customer_code,customers.custmer_name
from transactions 
INNER JOIN customers ON 
transactions.customer_code = customers.customer_code) as revenue_per_cust
group by custmer_name
order by sum(sales_amount) desc

#MONTHLY REVENUE PER YEAR

select sum(sales_qty) as sales,sum(sales_amount)as revenue,year, month_name
from
(select date.year,date.month_name,transactions.sales_qty,transactions.sales_amount
from date 
INNER JOIN transactions ON
transactions.order_date = date.date)as monthly_rev_sales_per_year
group by date.year,date.month_name
order by year,month_name

#Latest value of the TOTAL REVENUE
select sum(transactions.sales_amount)
from transactions

select sum(transactions.sales_Qty)
from transactions

