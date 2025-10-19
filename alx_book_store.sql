-- alx_book_store.sql
-- SQL script to create the alx_book_store database and its tables

CREATE DATABASE IF NOT EXISTS `alx_book_store`;
USE `alx_book_store`;

-- Authors table
CREATE TABLE IF NOT EXISTS `Authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(215) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Books table
CREATE TABLE IF NOT EXISTS `Books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(130) NOT NULL,
  `author_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `publication_date` DATE,
  PRIMARY KEY (`book_id`),
  INDEX `idx_books_author` (`author_id`),
  CONSTRAINT `fk_books_author` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Customers table
CREATE TABLE IF NOT EXISTS `Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(215) NOT NULL,
  `email` VARCHAR(215) NOT NULL,
  `address` TEXT,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `uix_customers_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Orders table
CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATE NOT NULL DEFAULT (CURRENT_DATE),
  PRIMARY KEY (`order_id`),
  INDEX `idx_orders_customer` (`customer_id`),
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Order_Details table
CREATE TABLE IF NOT EXISTS `Order_Details` (
  `orderdetailid` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  PRIMARY KEY (`orderdetailid`),
  INDEX `idx_orderdetails_order` (`order_id`),
  INDEX `idx_orderdetails_book` (`book_id`),
  CONSTRAINT `fk_orderdetails_order` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orderdetails_book` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Optional: sample data (uncomment to insert sample rows)
-- INSERT INTO `Authors` (`author_name`) VALUES ('Jane Austen'), ('George Orwell');
-- INSERT INTO `Books` (`title`, `author_id`, `price`, `publication_date`) VALUES
--   ('Pride and Prejudice', 1, 9.99, '1813-01-28'),
--   ('1984', 2, 12.50, '1949-06-08');
-- INSERT INTO `Customers` (`customer_name`, `email`, `address`) VALUES
--   ('John Doe', 'john@example.com', '123 Main St'),
--   ('Jane Smith', 'jane@example.com', '456 Oak Ave');
-- INSERT INTO `Orders` (`customer_id`, `order_date`) VALUES (1, '2025-10-19');
-- INSERT INTO `Order_Details` (`order_id`, `book_id`, `quantity`) VALUES (1, 1, 1);

-- End of file
