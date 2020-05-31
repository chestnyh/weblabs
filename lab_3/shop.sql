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