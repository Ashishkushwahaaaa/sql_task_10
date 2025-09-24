-- Queries

-- Top Customers by Spend
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 3;


-- Best-Selling Products (by revenue)
SELECT pr.product_name, pr.category,
       SUM(oi.quantity * pr.price) AS total_revenue,
       SUM(oi.quantity) AS total_units_sold
FROM products pr
JOIN order_items oi ON pr.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY pr.product_id
ORDER BY total_revenue DESC;


-- Monthly Sales Report
SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
       SUM(p.amount) AS total_sales,
       COUNT(p.payment_id) AS total_orders
FROM payments p
GROUP BY month
ORDER BY month;
