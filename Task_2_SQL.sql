
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
    email VARCHAR(191) UNIQUE,
       phone VARCHAR(15),
    address TEXT
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(100),
  description TEXT,
        price DECIMAL(10,2),
    stock INT
);


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (name, email, phone, address)
VALUES 
('Pawan Patil', 'pavan@example.com', '9998887776', 'NAshik'),
('Neha Rawal', 'neha@example.com', NULL, 'Mumbai'),
('Amit Thakre', 'amit@example.com', '8887776665', NULL);


INSERT INTO products (name, description, price, stock)
VALUES 
('Laptop', '14 inch Laptop', 45000.00, 10),
('Phone', 'Smartphone 6 inch', 25000.00, 15),
('Headphones', NULL, 2000.00, 30);


INSERT INTO orders (customer_id, order_date, status)
VALUES 
(1, '2025-08-01', 'Confirmed'),
(2, '2025-08-02', 'Shipped');


INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 45000.00),
(1, 3, 2, 4000.00),
(2, 2, 1, 25000.00);


UPDATE products SET stock = stock - 2 WHERE product_id = 3;

DELETE FROM customers WHERE name = 'Amit Singh';

INSERT INTO products (name, description, price, stock)
SELECT name, description, price, stock FROM products WHERE product_id = 2;