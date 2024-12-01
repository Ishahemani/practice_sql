# Calculate the cumulative sales per month for each year
select payment,sum(payment) over (order by years,months) cum_sales,months,years from
(select round(sum(payments.payment_value),0) as payment,month(orders.order_purchase_timestamp) as months,year(orders.order_purchase_timestamp) as years
from orders join payments
on orders.order_id = payments.order_id
group by month(orders.order_purchase_timestamp),year(orders.order_purchase_timestamp)
order by year(orders.order_purchase_timestamp),month(orders.order_purchase_timestamp))as a
