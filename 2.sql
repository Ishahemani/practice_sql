select * from orders;
select count(order_id) from orders 
where year(order_purchase_timestamp) = 2017