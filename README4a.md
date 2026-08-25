SQL code creates an e-commerce database named ecommerce_db and defines several related tables to manage an online shopping system. First, it creates the Categories table to store product categories such as Electronics, Fashion, Books, and Sports. The Customers table stores customer information such as name, email, phone, password, gender, and date of birth, while the Addresses table stores customers' delivery addresses. The Suppliers table contains information about companies that supply products, and the Products table stores product details such as name, category, supplier, price, discount, stock quantity, and description. The Orders table records customer orders and their status, while Order_Items stores the individual products included in each order, including quantity, unit price, and automatically calculated subtotal. The Payments table stores payment information for each order, including payment method, payment status, and amount paid. The Reviews table allows customers to rate and comment on products. The FOREIGN KEY constraints establish relationships between these tables and maintain referential integrity, while options such as ON DELETE CASCADE, ON DELETE RESTRICT, and ON DELETE SET NULL control what happens to related records when a referenced record is deleted. The INSERT statements then add sample categories, suppliers, customers, addresses, products, orders, order items, and payments, and the SELECT * statements display the inserted data. Finally, the code attempts to insert products into a Cart table, but the Cart table has not been created in the provided script, so that final INSERT INTO Cart statement will produce an error unless a Cart table is created first.
E-Commerce Database Management System

Project Overview

This project contains a MySQL database design for an E-Commerce Management System. It manages customers, addresses, product categories, suppliers, products, orders, order items, payments, reviews, and shopping carts.

The database is designed using relational database principles and is organized approximately up to Third Normal Form (3NF).

Database Name

ecommerce_db

Tables

The database contains the following tables:

Categories - Stores product categories.

Customers - Stores customer information.

Addresses - Stores customer delivery addresses.

Suppliers - Stores supplier information.

Products - Stores product details, prices, discounts, and stock.

Orders - Stores customer orders and order status.

Order_Items - Stores products included in each order.

Payments - Stores payment information for orders.

Reviews - Stores customer reviews and product ratings.

Cart - Stores products currently added to customers' carts.

Relationships

One Category can contain many Products.

One Supplier can supply many Products.

One Customer can have many Addresses.

One Customer can place many Orders.

One Order can contain many Order_Items.

One Product can appear in many Order_Items.

One Order has one Payment.

One Customer can write many Reviews.

One Product can receive many Reviews.

One Customer can have many Cart items.

One Product can be present in many customers' carts.

Normalization

First Normal Form (1NF)

The database satisfies 1NF because:

Each table has a primary key.

Each column contains atomic values.

There are no repeating groups.

Each field stores a single value.

Second Normal Form (2NF)

The database satisfies 2NF because:

It is already in 1NF.

Non-key attributes depend on the complete primary key.

Most tables use a single-column primary key, eliminating partial dependency problems.

Third Normal Form (3NF)

The database is designed approximately in 3NF because:

It is already in 2NF.

Related information is separated into different tables.

Non-key attributes depend on the primary key rather than on other non-key attributes.

For example, category information is stored separately in Categories instead of being repeated in every product record.

Important Design Notes

Order Total

Orders.total_amount is a derived value because the total can be calculated from:

quantity × unit_price

for all items belonging to an order.

For strict normalization, the order total can instead be calculated using:

SELECT order_id, SUM(quantity * unit_price) AS total_amount
FROM Order_Items
GROUP BY order_id;

Order Item Subtotal

Order_Items.subtotal is a generated column:

subtotal = quantity * unit_price

MySQL calculates it automatically.

Reviews

To prevent the same customer from reviewing the same product multiple times, the following constraint is recommended:

UNIQUE (product_id, customer_id)

Cart Table

The original SQL contains INSERT INTO Cart statements but does not contain the CREATE TABLE Cart statement.

The following table should be created before inserting cart data:

CREATE TABLE Cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (customer_id, product_id)
);

Database Structure

E-Commerce Database
│
├── Categories
│      └── Products
│            ├── Order_Items
│            │      └── Orders
│            │             ├── Customers
│            │             ├── Addresses
│            │             └── Payments
│            │
│            ├── Suppliers
│            └── Reviews
│                   └── Customers
│
└── Cart
       ├── Customers
       └── Products

Sample Data

The database includes sample records for:

5 categories

5 suppliers

5 customers

5 addresses

10 products

5 orders

7 order items

5 payments

Sample cart items

SQL Execution Order

Run the SQL script in the following order:

Drop the existing database.

Create the database.

Select the database using USE ecommerce_db.

Create the tables.

Insert categories.

Insert suppliers.

Insert customers.

Insert addresses.

Insert products.

Insert orders.

Insert order items.

Insert payments.

Create the Cart table.

Insert cart records.

Run SELECT queries to verify the data.

Conclusion

The E-Commerce Database Management System provides a structured relational database for managing an online shopping platform. The database uses primary keys, foreign keys, constraints, generated columns, and relationships between tables. Its structure is approximately normalized up to 3NF, which reduces unnecessary data duplication and improves data consistency.
