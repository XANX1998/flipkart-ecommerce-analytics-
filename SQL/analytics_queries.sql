1. Monthly Sales Trend
CREATE TABLE monthly_sales AS
SELECT 
    order_year,
    order_month,
    SUM(net_amount) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders,
    AVG(net_amount) AS avg_order_value
FROM sales_fact
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

2. Top Products by Revenue
CREATE TABLE top_products AS
SELECT 
    p.product_id,
    p.product_name,
    SUM(sf.quantity) AS total_quantity,
    SUM(sf.net_amount) AS total_revenue,
    AVG(sf.rating) AS avg_rating
FROM sales_fact sf
JOIN products p ON sf.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

3. Seller Performance
CREATE TABLE seller_performance AS
SELECT 
    s.seller_id,
    s.seller_name,
    COUNT(sf.order_id) AS total_orders,
    SUM(sf.net_amount) AS total_revenue,
    AVG(sf.rating) AS avg_rating
FROM sales_fact sf
JOIN sellers s ON sf.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_name
ORDER BY total_revenue DESC;

4. Customer Demographics & Spending
CREATE TABLE customer_spending AS
SELECT 
    c.customer_id,
    c.customer_name,
    c.state,
    c.city,
    c.gender,
    c.age,
    SUM(sf.net_amount) AS total_spent,
    COUNT(sf.order_id) AS total_orders,
    AVG(sf.rating) AS avg_rating
FROM sales_fact sf
JOIN customers c ON sf.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.state, c.city, c.gender, c.age;

5. Payment Method Analysis
CREATE TABLE payment_analysis AS
SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(net_amount) AS total_value,
    AVG(net_amount) AS avg_value
FROM sales_fact
GROUP BY payment_method
ORDER BY total_value DESC;

6. Delivery Performance
CREATE TABLE delivery_performance AS
SELECT 
    delivery_status,
    COUNT(*) AS total_orders,
    SUM(net_amount) AS total_value,
    AVG(rating) AS avg_rating
FROM sales_fact
GROUP BY delivery_status;









