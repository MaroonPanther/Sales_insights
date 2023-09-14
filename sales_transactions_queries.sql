SELECT * FROM sales.transactions;

select order_date from sales.transactions where order_date = "2017"

select sales_amount, currency,order_date from sales.transactions where currency = "USD"

#checking the amount of business(sales and profit in chennai)
select date.year,transactions.market_Code , round(sum(transactions.sales_amount),2) as revenue,round(sum(transactions.profit_margin),2) as profit
from sales.transactions
inner join sales.date ON 
date.date = transactions.order_date
where market_code = 'Mark001'
group by date.year,transactions.market_Code
order by round(sum(transactions.profit_margin),2) desc