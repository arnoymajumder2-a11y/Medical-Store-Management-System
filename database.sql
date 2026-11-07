CREATE DATABASE IF NOT EXISTS medical_store_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE medical_store_db;
CREATE TABLE admins(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(160) UNIQUE NOT NULL,password VARCHAR(255) NOT NULL);
INSERT INTO admins(name,email,password) VALUES('Admin','admin@meditrack.local','temporary-password-hash');
CREATE TABLE medicines(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(160) NOT NULL,category VARCHAR(80) NOT NULL,batch_no VARCHAR(80) UNIQUE NOT NULL,expiry_date DATE NOT NULL,quantity INT NOT NULL DEFAULT 0,reorder_level INT NOT NULL DEFAULT 10,price DECIMAL(10,2) NOT NULL);
CREATE TABLE sales(id INT AUTO_INCREMENT PRIMARY KEY,medicine_id INT NOT NULL,quantity INT NOT NULL,unit_price DECIMAL(10,2) NOT NULL,total_amount DECIMAL(12,2) NOT NULL,customer_name VARCHAR(120),sold_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY(medicine_id) REFERENCES medicines(id));
INSERT INTO medicines(name,ca
CREATE DATABASE IF NOT EXISTS medical_store_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE medical_store_db;

-- Admin table
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(160) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Medicines table
CREATE TABLE medicines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    category VARCHAR(80) NOT NULL,
    batch_no VARCHAR(80) UNIQUE NOT NULL,
    expiry_date DATE NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    reorder_level INT NOT NULL DEFAULT 10,
    price DECIMAL(10,2) NOT NULL
);

-- Sales table
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    customer_name VARCHAR(120),
    sold_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (medicine_id)
        REFERENCES medicines(id)
);

-- Sample medicine records
INSERT INTO medicines
(name, category, batch_no, expiry_date, quantity, reorder_level, price)
VALUES
('Paracetamol 500 mg', 'Tablet', 'PCM-2026-01', '2027-12-31', 120, 20, 2.50),
('Cetirizine 10 mg', 'Tablet', 'CTZ-2026-02', '2027-08-31', 65, 15, 3.00),
('Vitamin C 500 mg', 'Tablet', 'VTC-2026-03', '2028-03-31', 90, 20, 5.00),
('Antacid Suspension', 'Syrup', 'ANT-2026-04', '2027-05-31', 24, 8, 78.00);
tegory,batch_no,expiry_date,quantity,reorder_level,price) VALUES
('Paracetamol 500 mg','Tablet','PCM-2026-01','2027-12-31',120,20,2.50),
('Cetirizine 10 mg','Tablet','CTZ-2026-02','2027-08-31',65,15,3.00),
('Vitamin C 500 mg','Tablet','VTC-2026-03','2028-03-31',90,20,5.00),
('Antacid Suspension','Syrup','ANT-2026-04','2027-05-31',24,8,78.00);
