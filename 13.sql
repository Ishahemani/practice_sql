# Calculate the year-over-year growth rate of total sales
select years,sales,(((sales) - (last_sales))/(last_sales))* 100 as growth from (with a as(select year(orders.order_purchase_timestamp) as years,round(sum(payments.payment_value),0) as sales
from orders join payments
on orders.order_id = payments.order_id
group by years
order by years)
select years, sales,lag(sales,1) over(order by years) as last_sales from a) as b
