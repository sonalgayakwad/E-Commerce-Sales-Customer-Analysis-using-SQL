CREATE DATABASE ecommerce_project;
USE ecommerce_project;
CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
email VARCHAR(100),
city VARCHAR(50),
registration_date date
);
INSERT INTO Customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Mumbai', '2025-01-10'),
(2, 'Priya Patel', 'priya@gmail.com', 'Pune', '2025-01-15'),
(3, 'Rahul Verma', 'rahul@gmail.com', 'Delhi', '2025-02-02'),
(4, 'Sneha Joshi', 'sneha@gmail.com', 'Amravati', '2025-02-18'),
(5, 'Rohan Mehta', 'rohan@gmail.com', 'Nagpur', '2025-03-01'),
(6, 'Ananya Singh', 'ananya@gmail.com', 'Bhopal', '2025-03-12'),
(7, 'Vikram Rao', 'vikram@gmail.com', 'Hyderabad', '2025-03-20'),
(8, 'Neha Gupta', 'neha@gmail.com', 'Bengaluru', '2025-04-05'),
(9, 'Karan Shah', 'karan@gmail.com', 'Ahmedabad', '2025-04-14'),
(10, 'Isha Kulkarni', 'isha@gmail.com', 'Nashik', '2025-05-01');
SELECT*FROM Customers;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);
INSERT INTO Products
(product_id, product_name, category, price, stock)
VALUES
(101, 'Laptop', 'Electronics', 55000, 20),
(102, 'Smartphone', 'Electronics', 25000, 35),
(103, 'Headphones', 'Electronics', 2000, 80),
(104, 'Keyboard', 'Accessories', 1500, 60),
(105, 'Mouse', 'Accessories', 800, 100),
(106, 'Smart Watch', 'Wearables', 5000, 45),
(107, 'Backpack', 'Fashion', 1800, 50),
(108, 'Running Shoes', 'Fashion', 3500, 40),
(109, 'T-Shirt', 'Fashion', 900, 100),
(110, 'Power Bank', 'Electronics', 2200, 55);
SELECT * FROM Products;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2025-06-01', 'Delivered'),
(1002, 2, '2025-06-03', 'Delivered'),
(1003, 3, '2025-06-05', 'Delivered'),
(1004, 4, '2025-06-08', 'Cancelled'),
(1005, 5, '2025-06-10', 'Delivered'),
(1006, 6, '2025-06-12', 'Delivered'),
(1007, 1, '2025-06-15', 'Delivered'),
(1008, 7, '2025-06-18', 'Shipped'),
(1009, 8, '2025-06-20', 'Delivered'),
(1010, 9, '2025-06-22', 'Delivered'),
(1011, 10, '2025-06-25', 'Pending'),
(1012, 5, '2025-06-27', 'Delivered'),
(1013, 2, '2025-07-01', 'Delivered'),
(1014, 5, '2025-07-03', 'Delivered');
SELECT*FROM Orders;
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 55000),
(2, 1001, 103, 2, 2000),
(3, 1002, 102, 1, 25000),
(4, 1002, 105, 2, 800),
(5, 1003, 106, 1, 5000),
(6, 1003, 107, 1, 1800),
(7, 1004, 108, 1, 3500),
(8, 1005, 101, 1, 55000),
(9, 1005, 104, 1, 1500),
(10, 1006, 102, 1, 25000),
(11, 1006, 110, 2, 2200),
(12, 1007, 103, 3, 2000),
(13, 1007, 105, 2, 800),
(14, 1008, 108, 2, 3500),
(15, 1008, 109, 2, 900),
(16, 1009, 102, 1, 25000),
(17, 1009, 106, 1, 5000),
(18, 1010, 101, 1, 55000),
(19, 1010, 110, 1, 2200),
(20, 1011, 104, 2, 1500),
(21, 1012, 107, 2, 1800),
(22, 1012, 109, 3, 900),
(23, 1013, 102, 2, 25000),
(24, 1013, 103, 2, 2000),
(25, 1014, 106, 1, 5000),
(26, 1014, 105, 3, 800);
SELECT*FROM Order_Details;
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Payments
(payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(501, 1001, '2025-06-01', 'UPI', 'Paid', 59000),
(502, 1002, '2025-06-03', 'Card', 'Paid', 26600),
(503, 1003, '2025-06-05', 'UPI', 'Paid', 6800),
(504, 1004, '2025-06-08', 'Card', 'Refunded', 3500),
(505, 1005, '2025-06-10', 'Net Banking', 'Paid', 56500),
(506, 1006, '2025-06-12', 'UPI', 'Paid', 29400),
(507, 1007, '2025-06-15', 'UPI', 'Paid', 7600),
(508, 1008, '2025-06-18', 'Card', 'Paid', 8800),
(509, 1009, '2025-06-20', 'Card', 'Paid', 30000),
(510, 1010, '2025-06-22', 'Net Banking', 'Paid', 57200),
(511, 1011, '2025-06-25', 'UPI', 'Pending', 3000),
(512, 1012, '2025-06-27', 'UPI', 'Paid', 6300),
(513, 1013, '2025-07-01', 'Card', 'Paid', 54000),
(514, 1014, '2025-07-03', 'UPI', 'Paid', 7400);
SELECT * FROM Payments;
SELECT SUM(od.quantity * od.unit_price) AS total_sales
FROM Orders o
JOIN Order_Details od
ON o.order_id = od.order_id
WHERE o.order_status = 'Delivered';
SELECT 
    p.product_name,
    SUM(od.quantity) AS units_sold
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;
SELECT 
    p.category,
    SUM(od.quantity * od.unit_price) AS revenue
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;
SELECT 
    c.customer_name,
    SUM(od.quantity * od.unit_price) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;
SELECT COUNT(*) AS total_orders
FROM Orders;
SELECT AVG(price) AS average_product_price
FROM Products;
SELECT product_name, price
FROM Products
ORDER BY price DESC
LIMIT 1;
SELECT product_name, stock
FROM Products
WHERE stock < 50;
SELECT product_name, category, price, stock
FROM Products
ORDER BY price DESC;