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

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  group_id INT NOT NULL,
  INDEX index_user_id(user_id),
  INDEX index_group_id(group_id)
);
INSERT INTO
  orders (id, user_id, group_id)
VALUES
  (1, 35), (2, 42);
SELECT * FROM orders;

PAGER awk '/Trx id counter/, /FILE I\/O/';

--
-- デッドロック
--

-- A                                                        -- B
-- id = 1, id = 2 の group_id を入れ替える処理を試みる
BEGIN;
SELECT * FROM members WHERE id = 1 FOR UPDATE;
                                                            BEGIN;
                                                            SELECT * FROM members WHERE id = 2 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G;
-- RECORD LOCKS space id 46 page no 3 n bits 72 index PRIMARY of table `sample`.`members` trx id 2766 lock_mode X locks rec but not gap
-- Record lock, heap no 3 PHYSICAL RECORD: n_fields 4; compact format; info bits 0
--  0: len 4; hex 80000002; asc     ;;
--  1: len 6; hex 000000000ac5; asc       ;;
--  2: len 7; hex bd000001b1011c; asc        ;;
--  3: len 4; hex 8000002a; asc    *;;
-- 80000002 => WHERE id = 2 に該当、レコードロック＠クラスタインデックス
--
-- RECORD LOCKS space id 46 page no 3 n bits 72 index PRIMARY of table `sample`.`members` trx id 2765 lock_mode X locks rec but not gap
-- Record lock, heap no 2 PHYSICAL RECORD: n_fields 4; compact format; info bits 0
--  0: len 4; hex 80000001; asc     ;;
--  1: len 6; hex 000000000ac5; asc       ;;
--  2: len 7; hex bd000001b10110; asc        ;;
--  3: len 4; hex 80000023; asc    #;;
-- 80000001 => WHERE id = 1 に該当、レコードロック＠クラスタインデックス

SELECT * FROM members WHERE id = 2 FOR UPDATE;
-- 先行して B でレコードロックされているので時が止まる
                                                            SELECT * FROM members WHERE id = 1 FOR UPDATE;
                                                            -- デッドロック検出される
