with tab1 as (select orders.order_id,orders.customer_id,count(order_items.order_item_id) as total
from orders join order_items
on orders.order_id = order_items.order_id
group by orders.order_id,orders.customer_id)

select customers.customer_city, avg(tab1.total)
from tab1 join customers 
on customers.customer_id = tab1.customer_id
group by customers.customer_city;