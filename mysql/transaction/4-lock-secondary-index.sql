-- https://dbstudy.info/files/20140907/mysql_lock_r2.pdf
-- https://dev.mysql.com/doc/refman/5.7/en/innodb-locking.html
-- ↑日本語ページはない

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

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
  id INT PRIMARY KEY,
  balance INT NOT NULL,
  INDEX index_balance(balance)
);
INSERT INTO
  accounts (id, balance)
VALUES
  (1, 3000), (2, 4000), (3, 5000), (5, 8000), (10, 12000), (15, 20000);

-- SHOW ENGINE INNODB STATUS\G が長いので
-- 今回必要なロック関連のところだけ抽出する
PAGER awk '/Trx id counter/, /FILE I\/O/';
PAGER cat

-- 区間の示し方
-- (3, 5) 3 より大きく 5 未満
-- (3, 5] 3 より大きく 5 以下

--
-- セカンダリインデックスに対して等価検索
--

BEGIN;
SELECT * FROM accounts WHERE balance = 5000 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G
-- (1)
-- RECORD LOCKS space id 35 page no 4 n bits 80 index index_balance of table `sample`.`accounts` trx id 2553 lock_mode X
-- Record lock, heap no 4 PHYSICAL RECORD: n_fields 2; compact format; info bits 0
--  0: len 4; hex 80001388; asc     ;;
--  1: len 4; hex 80000003; asc     ;;
-- 80001388 => balance = 5000 に該当、ネクストキーロック＠セカンダリインデックス
-- INSERT されているデータ的に (3000, 5000] の区間ということになる
-- ちなみに、セカンダリインデックスなので、プライマリキーが一緒のところに収まっている
--
-- (2)
-- RECORD LOCKS space id 35 page no 3 n bits 80 index PRIMARY of table `sample`.`accounts` trx id 2553 lock_mode X locks rec but not gap
-- Record lock, heap no 4 PHYSICAL RECORD: n_fields 4; compact format; info bits 0
--  0: len 4; hex 80000003; asc     ;;
--  1: len 6; hex 0000000009f0; asc       ;;
--  2: len 7; hex bf000001360128; asc     6 (;;
--  3: len 4; hex 80001388; asc     ;;
-- 80000003 => WHERE id = 3 に該当、レコードロック＠クラスタインデックス
--
-- (3)
-- RECORD LOCKS space id 35 page no 4 n bits 80 index index_balance of table `sample`.`accounts` trx id 2553 lock_mode X locks gap before rec
-- Record lock, heap no 5 PHYSICAL RECORD: n_fields 2; compact format; info bits 0
--  0: len 4; hex 80001f40; asc    @;;
--  1: len 4; hex 80000005; asc     ;;
-- 80001f40 => balance = 8000 に該当、ギャップロック＠セカンダリインデックス
-- INSERT されているデータ的に (5000, 8000) の区間ということになる
--
-- (1) と (3) を合わせると (3000, 8000) がロック範囲＠セカンダリインデックス
COMMIT;
