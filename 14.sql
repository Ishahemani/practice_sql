WITH a AS (
    SELECT distinct t1.customer_id
    FROM orders t1
    JOIN orders t2 ON t1.customer_id = t2.customer_id
    WHERE TIMESTAMPDIFF(MONTH, t1.order_purchase_timestamp, t2.order_purchase_timestamp) <= 6
)
SELECT 
    (CAST(COUNT(a.customer_id) AS DECIMAL(10, 2)) / CAST((SELECT COUNT(customer_id) FROM orders) AS DECIMAL(10, 2))) * 100 AS retention_rate
FROM a;



