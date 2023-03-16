create database ebook;
CREATE TABLE ebook.user (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  phno VARCHAR(45) NULL,
  password VARCHAR(45) NULL,
  adress VARCHAR(45) NULL,
  landmark VARCHAR(45) NULL,
  city VARCHAR(45) NULL,
  state VARCHAR(45) NULL,
  pincode VARCHAR(45) NULL,
  PRIMARY KEY (id))
  
  CREATE TABLE ebook.book_dtls (
  bookId INT NOT NULL AUTO_INCREMENT,
  bookname VARCHAR(45) NULL,
  author VARCHAR(45) NULL,
  price VARCHAR(45) NULL,
  bookCategory VARCHAR(45) NULL,
  status VARCHAR(45) NULL,
  photo VARCHAR(45) NULL,
  user_email VARCHAR(45) NULL,
  PRIMARY KEY (bookId));