PRAGMA foreign_keys = ON;

SELECT product_id, COUNT(*) AS orders_count
FROM orders
GROUP BY product_id;

SELECT p.id, p.name, COUNT(o.id) AS orders_count
FROM products AS p
LEFT JOIN orders AS o ON o.product_id = p.id
GROUP BY p.id;

SELECT p.id, p.name,
       COUNT(o.id) AS orders_count,
       SUM(o.quantity) AS total_quantity
FROM products AS p
LEFT JOIN orders AS o ON o.product_id = p.id
GROUP BY p.id;

SELECT status, order_date, COUNT(*) AS orders_count
FROM orders
GROUP BY status, order_date
ORDER BY status, order_date;

SELECT status, order_date, COUNT(*) AS orders_count
FROM orders
GROUP BY status;

SELECT status, order_date, COUNT(*) AS orders_count
FROM orders
GROUP BY status;