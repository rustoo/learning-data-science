use magist;
select * from order_reviews;
select * from geo;
SELECT *
	FROM orders;
SELECT COUNT(order_id)
	FROM orders;
SELECT sum(order_status)
select order_status, count(order_status) c from orders
group by order_status having c = 1;
SELECT order_status FROM orders
	GROUP BY order_status HAVING COUNT(order_status) = 1;
SELECT order_status FROM orders;
SELECT order_status, count(order_status)
	FROM orders
    GROUP BY order_status;
SELECT order_status, count(order_status)
	FROM orders
    GROUP BY order_status;
SELECT 
    COUNT(*) AS orders_count
FROM
    orders;
SELECT 
    order_status, 
    COUNT(*) AS orders
FROM
    orders
GROUP BY order_status;
SELECT 
    YEAR(order_purchase_timestamp) AS year_,
    MONTH(order_purchase_timestamp) AS month_,
    COUNT(customer_id)
FROM
    orders
GROUP BY year_ , month_
ORDER BY year_ , month_;
SELECT 
    COUNT(DISTINCT product_id) AS products_count
FROM
    products;
SELECT 
    product_category_name, 
    COUNT(DISTINCT product_id) AS n_products
FROM
    products
GROUP BY product_category_name
ORDER BY COUNT(product_id) DESC;
SELECT 
	count(DISTINCT product_id) AS n_products
FROM
	order_items;
    SELECT 
    MIN(price) AS cheapest, 
    MAX(price) AS most_expensive
FROM 
	order_items;
SELECT 
	MAX(payment_value) as highest,
    MIN(payment_value) as lowest
FROM
	order_payments;
SELECT
    SUM(payment_value) AS highest_order
FROM
    order_payments
GROUP BY
    order_id
ORDER BY
    highest_order DESC
LIMIT
    1;
SELECT * from order_reviews;
select * from magist
SELECT * from 
	AVG(review_score)
    FROM order_reviews;
use magist;
select * from sellers;
---------- SELECT seller_id, sum(price) as seller_total_amt -----------
SELECT ,count(product_category_name) as cat_count
FROM products
INNER JOIN order_items USING(product_id)
RIGHT JOIN orders USING(order_id);
SELECT sum(price)
FROM products
RIGHT JOIN order_items USING(product_id)
RIGHT JOIN orders USING(order_id);

----------------------------------- What is the total amount earned by all sellers? What is the total amount earned by all Tech sellers? -----------------------------------
-----------------------------------Can you work out the average monthly income of all sellers? Can you work out the average monthly income of Tech sellers? -----------------------------------
use magist;
SELECT s.seller_id, SUM(price) as total_amt
FROM sellers as s
LEFT JOIN order_items as oi ON s.seller_id = oi.seller_id
GROUP BY s.seller_id;
-------------------------------------
SELECT s.seller_id, SUM(price)
FROM sellers as s
LEFT JOIN order_items as oi
ON s.seller_id = oi.seller_id
GROUP BY price;
-------------------------------------
SELECT * FROM product_category_name_english;

-------------------------------------
SELECT 
      COUNT(DISTINCT s.seller_id)
FROM 
    sellers s
left JOIN 
    order_items oi ON s.seller_id = oi.seller_id
right join 
    products p ON oi.product_id = p.product_id
 left JOIN 
    product_category_name_translation pn ON p.product_category_name = pn.product_category_name

WHERE 
   pn.product_category_name_english in ('audio' ,'consoles_games','electronics,computers_accessories','telephony');
   
-----------------------------------------

use magist;
SELECT s.seller_id, SUM(price)
FROM sellers as s
LEFT JOIN order_items AS oi ON s.seller_id = oi.seller_id
LEFT JOIN products AS p ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation AS pt ON p.product_category_name=pt.product_category_name
WHERE pt.product_category_name_english in ('audio' ,'consoles_games','electronics,computers_accessories','telephony')
GROUP BY s.seller_id;