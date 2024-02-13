-- prepares a MySQL server for the project Binary Briefs

CREATE DATABASE IF NOT EXISTS bibr_test_db;
CREATE USER IF NOT EXISTS 'bibr_test'@'localhost' IDENTIFIED BY 'Warrior_7';
GRANT ALL PRIVILEGES ON `bibr_test_db`.* TO 'bibr_test'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'bibr_test'@'localhost';
FLUSH PRIVILEGES;
