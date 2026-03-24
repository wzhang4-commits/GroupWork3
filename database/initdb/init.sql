CREATE DATABASE IF NOT EXISTS IS436;
USE IS436;

DROP TABLE IF EXISTS Order_Item;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orderitem_order
        FOREIGN KEY (order_id)
        REFERENCES `Order`(order_id),
    CONSTRAINT fk_orderitem_product
        FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
);

INSERT INTO Customer (first_name, last_name, email, address)
VALUES
('Wilson', 'Zhang', 'wilson.zhang@email.com', '100 Hilltop Circle, Baltimore, MD'),
('Emily', 'Carter', 'emily.carter@email.com', '25 Market Street, Columbia, MD'),
('Michael', 'Lee', 'michael.lee@email.com', '78 Main Street, Ellicott City, MD'),
('Sarah', 'Johnson', 'sarah.johnson@email.com', '50 Charles Street, Towson, MD');

INSERT INTO Product (name, description, price, stock_quantity)
VALUES
('Deluxe Ball Kit', '10 foosball variety pack for different styles of play', 34.00, 25),
('Foosball Replacement Ball', 'Standard replacement foosball ball', 4.99, 100),
('Foosball Table Cover', 'Protective cover for foosball table', 19.99, 40),
('Foosball Grip Handles', 'Replacement grip handles for better control', 12.50, 30);

INSERT INTO `Order` (order_date, status, total_amount, customer_id)
VALUES
('2026-03-20', 'Completed', 34.00, 1),
('2026-03-21', 'Completed', 14.97, 2),
('2026-03-22', 'Processing', 39.98, 3),
('2026-03-23', 'Shipped', 46.50, 4);

INSERT INTO Order_Item (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 34.00),
(2, 2, 3, 4.99),
(3, 3, 2, 19.99),
(4, 4, 1, 12.50),
(4, 1, 1, 34.00);