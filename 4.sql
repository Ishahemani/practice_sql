select (select count(order_id) from payments
where payment_installments >= 1) / (select count(order_id) from payments) * 100 as percentage;
select * from payments