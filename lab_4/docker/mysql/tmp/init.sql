CREATE USER 'weblabs' IDENTIFIED BY 'weblabs';

CREATE DATABASE `users`;

USE users;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(64) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    name VARCHAR(50), 
    shop_id INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uc_users_email UNIQUE (email),
    CONSTRAINT uc_users_phone UNIQUE (phone)
)  ENGINE=INNODB;

INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email0@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-00', 'user_name0', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email1@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-01', 'user_name1', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email2@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-02', 'user_name2', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email3@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-03', 'user_name3', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email4@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-04', 'user_name4', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email5@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-05', 'user_name5', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email6@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-06', 'user_name6', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email7@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-07', 'user_name7', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email8@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-08', 'user_name8', 1);
INSERT INTO users.users (email, password, phone, name, shop_id) VALUES ('some.email9@a.ua', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '+000-000-00-00-09', 'user_name9', 1);

GRANT ALL PRIVILEGES ON users.* TO 'weblabs';

/** shop **/

CREATE DATABASE shop;

USE shop;

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    photo VARCHAR(2048),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 1,
    discount TINYINT,
    CONSTRAINT CHECK (discount >= 0 AND discount>= 100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    delivery_data JSON NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS orders_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES orders(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    product_id INT NOT NULL,    
    FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    count INT NOT NULL DEFAULT 1 CHECK(count >= 1),
    CONSTRAINT uc_products_orders_order_id_product_id UNIQUE (order_id, product_id)

) ENGINE=INNODB;

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

GRANT ALL PRIVILEGES ON shop.* TO 'weblabs';