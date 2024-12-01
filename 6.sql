select count(order_id),monthname(order_purchase_timestamp) as mon from orders
where year(order_purchase_timestamp) = 2018
group by mon;