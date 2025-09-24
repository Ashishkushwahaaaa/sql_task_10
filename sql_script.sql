CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table (bridge between Orders and Products)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


INSERT INTO customers (first_name, last_name, email, city, country) VALUES
('Alice', 'Johnson', 'alice@example.com', 'New York', 'USA'),
('Bob', 'Smith', 'bob@example.com', 'Los Angeles', 'USA'),
('Charlie', 'Brown', 'charlie@example.com', 'London', 'UK'),
('David', 'Lee', 'david@example.com', 'Toronto', 'Canada'),
('Eva', 'Martinez', 'eva@example.com', 'Madrid', 'Spain');


INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Headphones', 'Accessories', 150.00),
('Backpack', 'Fashion', 70.00),
('Desk Chair', 'Furniture', 250.00);


INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-01-05'),
(2, '2025-01-10'),
(3, '2025-02-02'),
(4, '2025-02-15'),
(5, '2025-03-01');


INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),   -- Alice bought 1 Laptop
(2, 2, 1),   -- Bob bought 1 Smartphone
(3, 3, 2),   -- Charlie bought 2 Headphones
(4, 4, 1),   -- David bought 1 Backpack
(5, 5, 2);   -- Eva bought 2 Desk Chairs


INSERT INTO payments (order_id, amount, payment_date) VALUES
(1, 1200.00, '2025-01-06'),
(2, 800.00, '2025-01-11'),
(3, 300.00, '2025-02-03'), 
(4, 70.00, '2025-02-16'),
(5, 500.00, '2025-03-02'); 