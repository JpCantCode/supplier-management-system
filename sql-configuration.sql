Create the database
 CREATE DATABASE db_Rinos_capstone;
 
 -- Use the created database
 USE db_Rinos_capstone;
 
 -- Create users table
 CREATE TABLE tbl_users (
     id INT AUTO_INCREMENT PRIMARY KEY,
     firstname VARCHAR(100) NOT NULL,
     lastname VARCHAR(100) NOT NULL,
     email VARCHAR(100) UNIQUE NOT NULL,
     contactnumber INT,
     password VARCHAR(255) NOT NULL,
     role_id INT,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 );
 CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    email_address VARCHAR(255),
    address VARCHAR(255),
    lead_time INT,          
    payment_terms VARCHAR(50), 
    status VARCHAR(20)       
);
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),   
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    order_date DATE NOT NULL,
    delivery_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),         
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10, 2),
    payment_method VARCHAR(50), 
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
CREATE TABLE Supplier_Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    rating INT,                 -- 1-5 scale
    comments TEXT,
    rating_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);