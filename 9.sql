# Identify the correlation between product price and the number of times a product has been purchased
select count(order_items.product_id) as product_count,products.product_category,round(avg(order_items.price),2)
from order_items join products 
on order_items.product_id = products.product_id
group by products.product_category
order by product_count desc
