SELECT *
FROM (
    SELECT 
        YEAR(orders.order_purchase_timestamp) AS years,
        orders.customer_id,
        SUM(payments.payment_value) AS payment,
        RANK() OVER (PARTITION BY YEAR(orders.order_purchase_timestamp) ORDER BY SUM(payments.payment_value) desc) AS rn
    FROM 
        orders 
    JOIN 
        payments ON orders.order_id = payments.order_id
    GROUP BY 
        orders.customer_id, years
) AS ranked_orders
WHERE rn IN (1, 2, 3);

