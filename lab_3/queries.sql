-- All users orders
SELECT * FROM orders WHERE user_id=<user_id>;
-- All order's products
SELECT * FROM products WHERE order_id=<order_id>;
-- Product info with photo
SELECT * FROM products WHERE photo != null;
-- insert orders
INSERT INTO orders (user_id, delivery_data) VALUES (<user_id>, '<delivery_data>');
INSERT INTO orders_products (order_id, product_id, count) VALUES ({<order_id>}, {<product_id>, <count>);
-- insert users
INSERT INTO users (email, password, phone, name, shop_id) VALUES (<email>, <password>, <phone>, <name>, <shop_id>);