select products.product_category,round((sum(payments.payment_value)/(select sum(payment_value) from payments))*100,2) as sales
from products join order_items
on products.product_id = order_items.product_id
join payments on 
payments.order_id = order_items.order_id
group by products.product_category
order by sales desc;


