/*
=========================================
MIS443 - Business Data Management
Assignment 2
Schema: E-Commerce
File: 04_questions_01_30.sql

Purpose:
Complete all 30 SQL Practice questions.

Each question includes:
- Question description
- PostgreSQL SQL solution
=========================================
*/

-- Question1:  Return the complete customer roster from the customers table.
SELECT * FROM customers;
-- Explanation: Uses SELECT * to retrieve all records from the customers table.

-- Question 2: Return products that cost more than $100.
SELECT * FROM products
WHERE price > 100;
-- Explanation: Uses the WHERE clause to filter products with prices greater than $100.

-- Question 3: Return all products ordered by price descending.
SELECT * FROM products
ORDER BY price DESC;
-- -- Explanation: Uses ORDER BY DESC to sort products by price in descending order.

-- Question 4: Return customers from the USA.
SELECT * FROM customers
WHERE country = 'USA';
-- Explanation: Uses the WHERE clause to filter customers from the USA.

-- Question 5: Count the total number of products.
SELECT COUNT(*) AS total_products
FROM products;
-- Explanation: Uses the COUNT() aggregate function to count the total number of products.

-- Question 6: Calculate the average price across all products.
SELECT AVG(price) AS average_price
FROM products;
-- Explanation: Uses the AVG() aggregate function to calculate the average product price.

-- Question 7: Return products that belong to the Electronics category.
SELECT * FROM products
WHERE category_id = 1;
-- Explanation: Uses WHERE to filter products in the Electronics category.

-- Question 8: Return orders with a delivered status.
SELECT * FROM orders
WHERE status = 'delivered';
-- Explanation: Uses the WHERE clause to return delivered orders only.

-- Question 9: Return products with stock quantities greater than 50.
SELECT * FROM products
WHERE stock_quantity > 50;
-- Explanation: Uses the WHERE clause to filter products with stock quantities greater than 50.

-- Question 10: Return June 2023 orders and calculate how many days ago each order was placed as of 2023-07-01.
SELECT *,
       DATE '2023-07-01' - order_date AS days_ago
FROM orders
WHERE order_date BETWEEN '2023-06-01' AND '2023-06-30';
-- Explanation: Uses WHERE, BETWEEN, and date functions to filter June 2023 orders and calculate the number of days.

-- Question 11: Return each unique country with at least one registered customer.
SELECT DISTINCT country
FROM customers;
-- Explanation: Uses DISTINCT to return unique customer countries.

-- Question 12: Return customers who registered between January 1 and March 31, 2023.
SELECT * FROM customers
WHERE registration_date BETWEEN '2023-01-01' AND '2023-03-31';
-- Explanation: Uses the BETWEEN operator to filter customers by registration date.

-- Question 13: Return customers who have not provided their city.
SELECT * FROM customers
WHERE city = 'NULL';
-- Explanation: Uses = 'NULL' to find customers without city information.

-- Question 14: Return customer names together with their order information.
SELECT c.first_name,
       c.last_name,
       o.*
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;
-- Explanation: Uses INNER JOIN to combine customer and order information.

-- Question 15: Count the number of orders per customer.
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
-- Explanation: Uses GROUP BY and COUNT() to count orders for each customer.

-- Question 16: Return products together with their category names.
SELECT p.*,
       c.category_name
FROM products p
JOIN categories c
ON p.category_id = c.category_id;
-- Explanation: Uses INNER JOIN to display products with their category names.

-- Question 17: Return categories with more than $200 in revenue.
SELECT c.category_name,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name
HAVING SUM(oi.quantity * oi.unit_price) > 200;
-- Explanation: Uses JOIN, GROUP BY, SUM(), and HAVING to calculate and filter category revenue.

-- Question 18: Return products that have never appeared in any order.
SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
);
-- Explanation: Uses WHERE and NOT IN to find products that have never been ordered.

-- Question 19: Return non-Electronics products priced below the most expensive Electronics item.
SELECT *
FROM products
WHERE category_id <> 1
  AND price < (
      SELECT MAX(price)
      FROM products
      WHERE category_id = 1
  );
-- Explanation: Uses a subquery and WHERE to compare product prices with the highest-priced Electronics product.

 -- Question 20: Return every order item with the customer name, category name, product name, quantity, and unit price.
SELECT c.first_name,
       c.last_name,
       ca.category_name,
       p.product_name,
       oi.quantity,
       oi.unit_price
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON oi.product_id = p.product_id
JOIN categories ca
ON p.category_id = ca.category_id;
-- Explanation: Uses multiple INNER JOINs to combine customer, order, product, and category information.

-- Question 21: Return all customers with their order status, replacing missing order status values with a readable label.
SELECT c.first_name,
       c.last_name,
       COALESCE(o.status, 'No Orders') AS order_status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
-- Explanation: Uses LEFT JOIN and COALESCE() to display all customers and replace NULL values.

-- Question 22: Combine fulfilled and pending orders into one labeled result set.
SELECT order_id,
       customer_id,
       order_date,
       total_amount,
       'Fulfilled' AS order_status
FROM orders
WHERE status IN ('shipped', 'delivered')
UNION ALL
SELECT order_id,
       customer_id,
       order_date,
       total_amount,
       'Action Required' AS order_status
FROM orders
WHERE status = 'pending'
ORDER BY order_status, order_id;
-- Explanation: Uses UNION ALL to combine fulfilled and pending orders into one result set.

-- Question 23: Rank all products by price across the entire catalog.
SELECT product_id,
       product_name,
       price,
       RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products;
-- Explanation: Uses the RANK() window function to rank products by price.

-- Question 24: Return the top customer by total spending using a subquery.
SELECT customer_id,
       first_name,
       last_name
FROM customers
WHERE customer_id = (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    ORDER BY SUM(total_amount) DESC
    LIMIT 1
);
-- Explanation: Uses a subquery with GROUP BY, SUM(), ORDER BY, and LIMIT to find the top customer.

-- Question 25: For every customer, calculate order count, total spend, delivered spend, and assign a customer tier.
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(o.order_id) AS order_count,
       COALESCE(SUM(o.total_amount), 0) AS total_spend,
       COALESCE(SUM(CASE
                        WHEN o.status = 'delivered' THEN o.total_amount
                        ELSE 0
                    END), 0) AS delivered_spend,
       CASE
           WHEN COALESCE(SUM(o.total_amount), 0) >= 1000 THEN 'Gold'
           WHEN COALESCE(SUM(o.total_amount), 0) >= 500 THEN 'Silver'
           ELSE 'Bronze'
       END AS customer_tier
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
-- Explanation: Uses LEFT JOIN, GROUP BY, COUNT(), SUM(), CASE, and COALESCE() to calculate customer spending and assign tiers.

-- Question 26: Rank customers by total spending and assign percentile-style tiers.
SELECT customer_id,
       first_name,
       last_name,
       total_spend,
       RANK() OVER (ORDER BY total_spend DESC) AS spending_rank,
       NTILE(4) OVER (ORDER BY total_spend DESC) AS percentile_tier
FROM (
    SELECT c.customer_id,
           c.first_name,
           c.last_name,
           COALESCE(SUM(o.total_amount), 0) AS total_spend
    FROM customers c
    LEFT JOIN orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS customer_spending;
-- Explanation: Uses RANK() and NTILE() window functions to rank customers and assign percentile-style tiers.

-- Question 27: Use a CTE to find the highest-priced product in each category.
WITH max_price AS (
    SELECT category_id,
           MAX(price) AS highest_price
    FROM products
    GROUP BY category_id
)
SELECT c.category_name,
       p.product_name,
       p.price
FROM products p
JOIN max_price mp
ON p.category_id = mp.category_id
AND p.price = mp.highest_price
JOIN categories c
ON p.category_id = c.category_id;
-- Explanation: Uses a CTE (WITH), MAX(), and JOIN to find the highest-priced product in each category.

-- Question 28: Rank products by price within their own category.
SELECT product_id,
       product_name,
       category_id,
       price,
       RANK() OVER (
           PARTITION BY category_id
           ORDER BY price DESC
       ) AS price_rank
FROM products;
-- Explanation: Uses RANK() with PARTITION BY to rank products within each category.

-- Question 29: Return products priced above the average price of their own category.
SELECT product_id,
       product_name,
       category_id,
       price
FROM products p
WHERE price > (
    SELECT AVG(price)
    FROM products
    WHERE category_id = p.category_id
);
-- Explanation: Uses a correlated subquery with AVG() to compare each product's price with its category average.

-- Question 30: Return the top 5 products by total revenue.
SELECT p.product_id,
       p.product_name,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
-- Explanation: Uses JOIN, SUM(), GROUP BY, ORDER BY, and LIMIT to return the top 5 products by total revenue.
