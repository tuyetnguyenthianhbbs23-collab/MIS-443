/*
=========================================
MIS443 - Business Data Management
Assignment 2
Schema: E-Commerce
File: 02_create_tables_relationships.sql

Purpose:
Create all tables, primary keys,
foreign keys and relationships.
=========================================
*/

-- ======================================
-- TABLE 1 : CUSTOMERS
-- Stores customer information.
-- ======================================

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);

-------------------------------------------------------

-- ======================================
-- TABLE 2 : CATEGORIES
-- Stores product categories.
-- ======================================

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

-------------------------------------------------------

-- ======================================
-- TABLE 3 : PRODUCTS
-- Stores product information.
-- ======================================

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INTEGER NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INTEGER NOT NULL,
    created_date DATE NOT NULL,

    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

-------------------------------------------------------

-- ======================================
-- TABLE 4 : ORDERS
-- Stores customer orders.
-- ======================================

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-------------------------------------------------------

-- ======================================
-- TABLE 5 : ORDER_ITEMS
-- Stores products included in each order.
-- ======================================

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);