CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE IF NOT EXISTS AUTHORS (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    CONSTRAINT fk_books_author
        FOREIGN KEY (author_id)
        REFERENCES AUTHORS(author_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS CUSTOMERS (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

CREATE TABLE IF NOT EXISTS ORDERS (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_order_customer
		FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
	orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    CONSTRAINT fk_orderdetails_order
      FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    CONSTRAINT fk_orderdetails_book
      FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);
        