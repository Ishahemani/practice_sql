select * from payments;
select * from products;
select round(sum(payments.payment_value),0) as total_value, products.product_category
from payments join order_items on payments.order_id = order_items.order_id
join products on products.product_id = order_items.product_id
group by products.product_category;