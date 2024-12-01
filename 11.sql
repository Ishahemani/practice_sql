SELECT 
    customer_id,
    order_purchase_timestamp,
    payment_value,
    AVG(payment_value) OVER (
        PARTITION BY customer_id 
        ORDER BY order_purchase_timestamp 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS mov_avg
FROM (
    SELECT 
        orders.customer_id,
        orders.order_purchase_timestamp,
        payments.payment_value
    FROM 
        orders 
    JOIN 
        payments 
    ON 
        orders.order_id = payments.order_id
) AS a;

