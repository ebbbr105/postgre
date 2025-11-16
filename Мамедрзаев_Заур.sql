-- 1. Создание таблиц


--CREATE TABLE module1.customer (
--    customer_id int4 PRIMARY KEY,
--    first_name varchar(50),
--    last_name varchar(50),
--    gender varchar(50),
--    dob varchar(50),
--    job_title varchar(50),
--    job_industry_category varchar(50),
--    wealth_segment varchar(50),
--    deceased_indicator varchar(50),
--    owns_car varchar(50),
--    address varchar(50),
--    postcode int4,
--    state varchar(50),
--    country varchar(50),
--    property_valuation int4
--);

CREATE TABLE module1.product (
	row_id serial PRIMARY KEY,
    product_id int4,
    brand varchar(50),
    product_line varchar(50),
    product_class varchar(50),
    product_size varchar(50),
    list_price varchar(50),
    standard_cost varchar(50)
);

DROP TABLE module1.product;

CREATE TABLE module1.transaction_only (
    transaction_id int4 PRIMARY KEY,
    product_id int4,
    customer_id int4,
    transaction_date varchar(50),
    online_order bool,
    order_status varchar(50)
);


DROP TABLE module1.transaction_only;
-- 2. Вставка данных

-- 2.2 Копируем уникальные продукты
INSERT INTO module1.product (
    product_id, brand, product_line, product_class, product_size, list_price, standard_cost
)
SELECT DISTINCT
    product_id, brand, product_line, product_class, product_size, list_price, standard_cost
FROM module1.transaction;

-- 2.3 Копируем транзакции
INSERT INTO module1.transaction_only (
    transaction_id, product_id, customer_id, transaction_date, online_order, order_status
)
SELECT
    transaction_id, product_id, customer_id, transaction_date, online_order, order_status
FROM module1.transaction;


-- 3. Проверка 

-- Просмотр первых 5 клиентов
SELECT * FROM module1.customer LIMIT 5;

-- Просмотр первых 5 продуктов
SELECT * FROM module1.product LIMIT 5;

-- Просмотр первых 5 транзакций
SELECT * FROM module1.transaction_only LIMIT 5;



