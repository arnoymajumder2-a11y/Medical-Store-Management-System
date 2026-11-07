# Medical Store Management System — MediTrack

A PHP + MySQL academic portfolio project for pharmacy inventory and sales management.

## Features
- Admin authentication
- Dashboard with inventory, stock alerts and daily sales
- Medicine catalogue with batch, expiry, quantity and price
- Low-stock and expired-batch indicators
- Sales entry with stock validation and automatic inventory deduction
- Sales history and revenue summary
- Responsive interface and prepared SQL statements

## Requirements
- XAMPP (Apache + MySQL)
- PHP 8.0+ recommended
- MySQL / MariaDB

## Local installation
1. Copy `medical-store-management-system` into `C:\xampp\htdocs\`.
2. Start Apache and MySQL in XAMPP.
3. Open `http://localhost/phpmyadmin`.
4. Import `database.sql`.
5. Check `config.php` database credentials (default XAMPP: root with blank password).
6. Open `http://localhost/medical-store-management-system/setup.php` once.
7. Delete `setup.php` after setup.
8. Sign in at `http://localhost/medical-store-management-system/login.php`.

Demo login:
- Email: `admin@meditrack.local`
- Password: `Admin@123`

## Portfolio note
Use fictional sample data only. This is a student demonstration, not a clinical or regulated pharmacy system. Before public deployment, change credentials, enable HTTPS, harden authentication, and comply with applicable pharmacy, privacy, billing and tax requirements.
