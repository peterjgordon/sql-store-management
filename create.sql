CREATE DATABASE IF NOT EXISTS amazonia;
USE amazonia;
CREATE TABLE IF NOT EXISTS staff(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(20) NOT NULL,
    sortcode mediumint NOT NULL,
    account_number int NOT NULL,
    job_title varchar(20) NOT NULL,
    wage mediumint NOT NULL);
CREATE TABLE IF NOT EXISTS distributor(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(20) NOT NULL);
CREATE TABLE IF NOT EXISTS product(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(20) NOT NULL);
CREATE TABLE IF NOT EXISTS address(
    postcode varchar(8) NOT NULL PRIMARY KEY,
    town varchar(20) NOT NULL,
    county varchar(20) NOT NULL,
    country varchar(20) NOT NULL);
CREATE TABLE IF NOT EXISTS customer(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(20) NOT NULL,
    address varchar(20) NOT NULL,
    postcode varchar(8) NOT NULL,
    card_number bigint NOT NULL,
    phone_number varchar(16) NOT NULL,
    FOREIGN KEY (postcode) REFERENCES address(postcode));
CREATE TABLE IF NOT EXISTS basket(
    productID int,
    customerID int,
    quantity smallint NOT NULL,
    PRIMARY KEY (productID, customerID),
    FOREIGN KEY (productID) REFERENCES product(id),
    FOREIGN KEY (customerID) REFERENCES customer(id));
CREATE TABLE IF NOT EXISTS product_distributor(
    productID int,
    distributorID int,
    PRIMARY KEY(productID, distributorID),
    FOREIGN KEY (productID) REFERENCES product(id),
    FOREIGN KEY (distributorID) REFERENCES distributor(id));