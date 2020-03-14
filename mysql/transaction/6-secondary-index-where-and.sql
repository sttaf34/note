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

PAGER awk '/Trx id counter/, /FILE I\/O/';

--
-- 2つのカラムを検索条件にして検索・複合インデックスではない場合
--

BEGIN;
SELECT * FROM orders_single WHERE user_id = 1 AND product_id = 42 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G;
-- 説明を書くのが面倒なくらいに、いろんな範囲がロックされる

--
-- 2つのカラムを検索条件にして検索・複合インデックスな場合
--
BEGIN;
SELECT * FROM orders_multi WHERE user_id = 1 AND product_id = 42 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G;
-- RECORD LOCKS space id 50 page no 4 n bits 88 index index_user_id_product_id of table `sample`.`orders_multi` trx id 2816 lock_mode X
-- Record lock, heap no 3 PHYSICAL RECORD: n_fields 3; compact format; info bits 0
--  0: len 4; hex 80000001; asc     ;;
--  1: len 4; hex 8000002a; asc    *;;
--  2: len 4; hex 80000002; asc     ;;
-- 8000002a => WHERE product_id = 42 に該当、ネクストキーロック＠セカンダリインデックス
-- (1, 42) がレコードロックされ、手前がギャップロックされる
-- INSERT されているデータ的に ((1, 35),(1, 42)] の区間ということになる
--
-- RECORD LOCKS space id 50 page no 3 n bits 88 index PRIMARY of table `sample`.`orders_multi` trx id 2816 lock_mode X locks rec but not gap
-- Record lock, heap no 3 PHYSICAL RECORD: n_fields 5; compact format; info bits 0
--  0: len 4; hex 80000002; asc     ;;
--  1: len 6; hex 000000000af6; asc       ;;
--  2: len 7; hex e2000001bc011c; asc        ;;
--  3: len 4; hex 80000001; asc     ;;
--  4: len 4; hex 8000002a; asc    *;;
-- 80000002 => WHERE id = 2 に該当、レコードロック＠クラスタインデックス

-- RECORD LOCKS space id 50 page no 4 n bits 88 index index_user_id_product_id of table `sample`.`orders_multi` trx id 2816 lock_mode X locks gap before rec
-- Record lock, heap no 4 PHYSICAL RECORD: n_fields 3; compact format; info bits 0
--  0: len 4; hex 80000001; asc     ;;
--  1: len 4; hex 80000038; asc    8;;
--  2: len 4; hex 80000003; asc     ;;
-- 80000038 => WHERE product_id = 56 に該当、ギャップロック＠セカンダリインデックス
-- INSERT されているデータ的に ((1, 42),(1, 56)) の区間ということになる
