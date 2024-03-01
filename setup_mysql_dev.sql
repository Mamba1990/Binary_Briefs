-- prepares a MySQL server for the Binary Briefs project

CREATE DATABASE IF NOT EXISTS bibr_dev_db;
CREATE USER IF NOT EXISTS 'bibr_dev'@'localhost' IDENTIFIED BY 'Warrior_7';
GRANT ALL PRIVILEGES ON `bibr_dev_db`.* TO 'bibr_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'bibr_dev'@'localhost';
FLUSH PRIVILEGES;
