USE shop;
/** products **/
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url0.jpeg", "Product0", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 100.25, 10);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url1.jpeg", "Product1", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 99.30, 5);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url2.jpeg", "Product2", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 1123.25, 8);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url3.jpeg", "Product3", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 567.00, 20);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url4.jpeg", "Product4", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 356.15, 0);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url5.jpeg", "Product5", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 100.00, 0);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url6.jpeg", "Product6", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 1.00, 75);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url7.jpeg", "Product7", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 67.50, 0);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url8.jpeg", "Product8", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 40.25, 0);
INSERT INTO products (photo, name, description, price, discount) VALUES ("/some/photo/url9.jpeg", "Product9", "SOME DESCRIPTION HERE. SOME DESCRIPTION HERE", 900.25, 0);

/** orders **/

INSERT INTO orders (user_id, delivery_data) VALUES (1, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (1, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (1, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (4, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (4, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (4, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (6, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (6, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (6, '{"country": "Ukraine", "street":"Main street", "house": 13}');
INSERT INTO orders (user_id, delivery_data) VALUES (6, '{"country": "Ukraine", "street":"Main street", "house": 13}');

/** orders_products **/

INSERT INTO orders_products (order_id, product_id, count) VALUES (1, 2, 24);
INSERT INTO orders_products (order_id, product_id, count) VALUES (1, 3, 23);
INSERT INTO orders_products (order_id, product_id, count) VALUES (1, 6, 2);
INSERT INTO orders_products (order_id, product_id, count) VALUES (2, 6, 3);
INSERT INTO orders_products (order_id, product_id, count) VALUES (2, 5, 1);
INSERT INTO orders_products (order_id, product_id, count) VALUES (2, 2, 5);
INSERT INTO orders_products (order_id, product_id, count) VALUES (3, 2, 1);
INSERT INTO orders_products (order_id, product_id, count) VALUES (3, 5, 45);
INSERT INTO orders_products (order_id, product_id, count) VALUES (3, 9, 66);
INSERT INTO orders_products (order_id, product_id, count) VALUES (3, 8, 75);