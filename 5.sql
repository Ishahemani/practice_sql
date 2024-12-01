select * from customers;
select count(customer_id),customer_state
from customers
group by customer_state
order by customer_state