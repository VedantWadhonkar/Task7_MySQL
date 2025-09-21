-- Drop and create legacy database
DROP DATABASE IF EXISTS LegacyDB;
CREATE DATABASE LegacyDB;
USE LegacyDB;

-- Single unnormalized table (all data in one place)
CREATE TABLE legacy_customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    product_name VARCHAR(100),
    product_price DECIMAL(10,2),
    order_date DATE
);

-- Insert sample data
INSERT INTO legacy_customers (customer_name, customer_email, product_name, product_price, order_date)
VALUES
('Alice Johnson', 'alice@example.com', 'Laptop', 55000, '2025-01-12'),
('Bob Smith', 'bob@example.com', 'Mobile', 15000, '2025-02-20'),
('Alice Johnson', 'alice@example.com', 'Mouse', 800, '2025-03-10');
-- Drop and create new normalized database
DROP DATABASE IF EXISTS NewDB;
CREATE DATABASE NewDB;
USE NewDB;

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Insert unique customers
INSERT INTO NewDB.customers (name, email)
SELECT DISTINCT customer_name, customer_email
FROM LegacyDB.legacy_customers;

-- Insert unique products
INSERT INTO NewDB.products (product_name, price)
SELECT DISTINCT product_name, product_price
FROM LegacyDB.legacy_customers;

-- Insert orders by joining customers and products
INSERT INTO NewDB.orders (customer_id, product_id, order_date)
SELECT c.customer_id, p.product_id, l.order_date
FROM LegacyDB.legacy_customers l
JOIN NewDB.customers c ON l.customer_email = c.email
JOIN NewDB.products p ON l.product_name = p.product_name;
-- Drop and create legacy database
DROP DATABASE IF EXISTS LegacyDB;
CREATE DATABASE LegacyDB;
USE LegacyDB;

-- Single unnormalized table (all data in one place)
CREATE TABLE legacy_customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    product_name VARCHAR(100),
    product_price DECIMAL(10,2),
    order_date DATE
);

-- Insert sample data
INSERT INTO legacy_customers (customer_name, customer_email, product_name, product_price, order_date)
VALUES
('Alice Johnson', 'alice@example.com', 'Laptop', 55000, '2025-01-12'),
('Bob Smith', 'bob@example.com', 'Mobile', 15000, '2025-02-20'),
('Alice Johnson', 'alice@example.com', 'Mouse', 800, '2025-03-10');
-- Drop and create new normalized database
DROP DATABASE IF EXISTS NewDB;
CREATE DATABASE NewDB;
USE NewDB;

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Insert unique customers
INSERT INTO NewDB.customers (name, email)
SELECT DISTINCT customer_name, customer_email
FROM LegacyDB.legacy_customers;

-- Insert unique products
INSERT INTO NewDB.products (product_name, price)
SELECT DISTINCT product_name, product_price
FROM LegacyDB.legacy_customers;

-- Insert orders by joining customers and products
INSERT INTO NewDB.orders (customer_id, product_id, order_date)
SELECT c.customer_id, p.product_id, l.order_date
FROM LegacyDB.legacy_customers l
JOIN NewDB.customers c ON l.customer_email = c.email
JOIN NewDB.products p ON l.product_name = p.product_name;

USE NewDB;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

USE LegacyDB;
SELECT * FROM legacy_customers;


