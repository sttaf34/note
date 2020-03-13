--
-- 設定確認と準備
--

SHOW VARIABLES LIKE 'VERSION';                -- 5.7.29
SELECT @@tx_isolation;                        -- REPEATABLE-READ
SHOW VARIABLES LIKE 'default_storage_engine'; -- InnoDB

SET GLOBAL innodb_status_output = ON;
SET GLOBAL innodb_status_output_locks = ON;
SELECT @@innodb_status_output;
SELECT @@innodb_status_output_locks;

DROP TABLE IF EXISTS orders_single;
CREATE TABLE orders_single (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  INDEX index_user_id(user_id),
  INDEX index_product_id(product_id)
);
INSERT INTO
  orders_single (user_id, product_id)
VALUES
  (1, 35), (1, 42), (1, 56),
  (2, 28), (2, 35), (2, 56), (2, 77), (2, 84),
  (3, 28), (3, 42), (3, 77), (3, 84),
  (4, 56), (4, 77), (4, 84), (4, 100);

DROP TABLE IF EXISTS orders_multi;
CREATE TABLE orders_multi (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  INDEX index_user_id_product_id(user_id, product_id)
);
INSERT INTO
  orders_multi (user_id, product_id)
VALUES
  (1, 35), (1, 42), (1, 56),
  (2, 28), (2, 35), (2, 56), (2, 77), (2, 84),
  (3, 28), (3, 42), (3, 77), (3, 84),
  (4, 56), (4, 77), (4, 84), (4, 100);

--
-- 2つのカラムを検索条件にして検索・複合インデックスではない場合
--

BEGIN;
SELECT * FROM orders_single WHERE user_id = 1 AND product_id = 42 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G;

--
-- 2つのカラムを検索条件にして検索・複合インデックスな場合
--
BEGIN;
SELECT * FROM orders_multi WHERE user_id = 1 AND product_id = 42 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G;
