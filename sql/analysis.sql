-- Café al Minuto — SQL
-- Tabla: orders

SELECT COUNT(*) pedidos, SUM(ticket_amount) facturacion,
       AVG(ticket_amount) ticket_promedio,
       AVG(wait_minutes) espera_promedio,
       AVG(satisfaction) satisfaccion,
       AVG(returned_within_30d) tasa_retorno
FROM orders;

SELECT hour, COUNT(*) pedidos, SUM(ticket_amount) facturacion
FROM orders GROUP BY hour ORDER BY hour;

SELECT category, COUNT(*) pedidos, SUM(ticket_amount) facturacion,
       AVG(ticket_amount) ticket_promedio
FROM orders GROUP BY category ORDER BY facturacion DESC;

SELECT channel, COUNT(*) pedidos, SUM(ticket_amount) facturacion,
       AVG(satisfaction) satisfaccion
FROM orders GROUP BY channel ORDER BY facturacion DESC;

SELECT customer_type, COUNT(*) pedidos, AVG(ticket_amount) ticket_promedio,
       AVG(satisfaction) satisfaccion, AVG(returned_within_30d) tasa_retorno
FROM orders GROUP BY customer_type;

SELECT CASE
       WHEN wait_minutes < 7 THEN '<7 min'
       WHEN wait_minutes < 12 THEN '7-11 min'
       WHEN wait_minutes < 18 THEN '12-17 min'
       ELSE '18+ min' END tramo_espera,
       COUNT(*) pedidos, AVG(satisfaction) satisfaccion
FROM orders GROUP BY 1 ORDER BY 1;

SELECT product, SUM(quantity) unidades, SUM(ticket_amount) facturacion
FROM orders GROUP BY product ORDER BY facturacion DESC LIMIT 10;
