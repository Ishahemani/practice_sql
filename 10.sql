select *,rank() over(order by revenue desc) from
(select sellers.seller_id,round(sum(payments.payment_value),2) as revenue
from sellers join order_items
on sellers.seller_id = order_items.seller_id
join payments on 
payments.order_id = order_items.order_id
group by sellers.seller_id) as a

