CREATE USER 'guest'@'localhost' IDENTIFIED BY 'guest123456';
GRANT ALL PRIVILEGES ON *.* TO 'guest'@'localhost';
FLUSH PRIVILEGES;