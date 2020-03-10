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
  balance INT NOT NULL
);
INSERT INTO
  accounts (id, balance)
VALUES
  (1, 10000), (2, 10000), (3, 10000), (5, 10000), (10, 10000), (15, 10000);

-- SHOW ENGINE INNODB STATUS\G が長いので
-- 今回必要なロック関連のところだけ抽出する
PAGER awk '/Trx id counter/, /FILE I\/O/';
PAGER cat

-- 区間の示し方
-- (3, 5) 3 より大きく 5 未満
-- (3, 5] 3 より大きく 5 以下

--
-- クラスタインデックスに対して等価検索・レコードロック
--

BEGIN;
SELECT * FROM accounts WHERE id = 3 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G
-- RECORD LOCKS space id 34 page no 3 n bits 80 index PRIMARY of table `sample`.`accounts` trx id 2529 lock_mode X locks rec but not gap
-- Record lock, heap no 4 PHYSICAL RECORD: n_fields 4; compact format; info bits 0
--  0: len 4; hex 80000003; asc     ;;
--
-- lock_mode X locks rec but not gap => 排他ロックでレコードロックでギャップロックがないと言っている
-- 80000003 => WHERE id = 3 に該当する、↑なので、該当インデックスだけレコードロックされる
COMMIT;

--
-- クラスタインデックスに対して等価検索して空振り・ギャップロック
--

BEGIN;
SELECT * FROM accounts WHERE id = 7 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G
-- RECORD LOCKS space id 34 page no 3 n bits 80 index PRIMARY of table `sample`.`accounts` trx id 2530 lock_mode X locks gap before rec
-- Record lock, heap no 6 PHYSICAL RECORD: n_fields 4; compact format; info bits 0
--  0: len 4; hex 8000000a; asc     ;;
--
-- lock_mode X locks gap before rec => 排他ロックでレコードの手前をギャップロックしていると言っている
-- 8000000a => id = 10 が該当する、で、↑なので、id = 10 の手前がギャップロックされる
-- INSERT されているデータ的に (5, 10) の区間ということになる
-- 別トランザクションからこの区間に INSERT しようとすると、時が止まる
COMMIT;

--
-- クラスタインデックスに対して範囲検索・ネクストキーロック
--

BEGIN;
SELECT * FROM accounts WHERE id BETWEEN 4 AND 5 FOR UPDATE;
SHOW ENGINE INNODB STATUS\G
-- RECORD LOCKS space id 34 page no 3 n bits 80 index PRIMARY of table `sample`.`accounts` trx id 2533 lock_mode X
-- Record lock, heap no 5 PHYSICAL RECORD: n_fields 4; compact format; info bits 0
--  0: len 4; hex 80000005; asc     ;;
-- Record lock, heap no 6 PHYSICAL RECORD: n_fields 4; compact format; info bits 0
--  0: len 4; hex 8000000a; asc     ;;
--
-- lock_mode X => 排他ロックでネクストキーロックだと言っている（書いてないが）
-- 80000005 => id = 5 がレコードロックされ、手前がギャップロックされる
-- 8000000a => id = 10 がレコードロックされ、手前がギャップロックされる
-- INSERT されているデータ的に (3, 5] と (5, 10] の区間ということになる
-- 区間を合わせると (3, 10] になる
COMMIT;
