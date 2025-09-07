-- Customers Table
CREATE TABLE ecommerce_customers (
    customer_id       INT PRIMARY KEY,
    customer_name     VARCHAR(100),
    gender            VARCHAR(10),
    age               INT,
    state             VARCHAR(50),
    signup_date       DATE
);

-- Products Table
CREATE TABLE ecommerce_products (
    product_id        INT PRIMARY KEY,
    product_name      VARCHAR(150),
    category          VARCHAR(100),
    sub_category      VARCHAR(100),
    price             DECIMAL(10,2),
    avg_rating        DECIMAL(3,2)
);

-- Sellers Table
CREATE TABLE ecommerce_sellers (
    seller_id         INT PRIMARY KEY,
    seller_name       VARCHAR(150),
    state             VARCHAR(50),
    rating            DECIMAL(3,2)
);

-- Sales Fact Table
CREATE TABLE ecommerce_sales_fact (
    order_id          INT PRIMARY KEY,
    order_date        DATE,
    customer_id       INT,
    product_id        INT,
    seller_id         INT,
    quantity          INT,
    discount_amount   DECIMAL(10,2),
    net_amount        DECIMAL(12,2),
    payment_method    VARCHAR(50),
    delivery_status   VARCHAR(50),

    FOREIGN KEY (customer_id) REFERENCES ecommerce_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES ecommerce_products(product_id),
    FOREIGN KEY (seller_id) REFERENCES ecommerce_sellers(seller_id)
);

-- ==============================================
-- Summary / Analysis Tables
-- (Optional - can be materialized views instead)
-- ==============================================

-- Monthly Sales Summary
CREATE TABLE ecommerce_monthly_sales (
    year              INT,
    month             INT,
    total_orders      INT,
    total_revenue     DECIMAL(15,2)
);

-- Customer Spending Summary
CREATE TABLE ecommerce_customer_spending (
    customer_id       INT,
    total_orders      INT,
    total_spent       DECIMAL(15,2),
    avg_order_value   DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES ecommerce_customers(customer_id)
);

-- Seller Performance
CREATE TABLE ecommerce_seller_performance (
    seller_id         INT,
    total_orders      INT,
    total_revenue     DECIMAL(15,2),
    avg_rating        DECIMAL(3,2),
    FOREIGN KEY (seller_id) REFERENCES ecommerce_sellers(seller_id)
);

-- Top Products
CREATE TABLE ecommerce_top_products (
    product_id        INT,
    total_quantity    INT,
    total_revenue     DECIMAL(15,2),
    avg_rating        DECIMAL(3,2),
    FOREIGN KEY (product_id) REFERENCES ecommerce_products(product_id)
);

-- Delivery Performance
CREATE TABLE ecommerce_delivery_performance (
    order_id          INT,
    delivery_status   VARCHAR(50),
    delivery_days     INT,
    FOREIGN KEY (order_id) REFERENCES ecommerce_sales_fact(order_id)
);

-- Payment Analysis
CREATE TABLE ecommerce_payment_analysis (
    payment_method    VARCHAR(50),
    total_orders      INT,
    total_revenue     DECIMAL(15,2)
);
