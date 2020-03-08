-- http://nippondanji.blogspot.com/2013/12/innodbrepeatable-readlocking-read.html
-- https://dev.mysql.com/doc/refman/5.6/ja/innodb-consistent-read.html

--
-- 設定確認と準備
--

SHOW VARIABLES LIKE 'VERSION';                -- 5.7.29
SELECT @@tx_isolation;                        -- REPEATABLE-READ
SHOW VARIABLES LIKE 'default_storage_engine'; -- InnoDB

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
  id INT PRIMARY KEY AUTO_INCREMENT,
  balance INT NOT NULL
);
INSERT INTO accounts (id, balance) VALUES (1, 10000);
SELECT * FROM accounts;

--
-- 一貫性読み取り
--

-- A                                                        -- B
BEGIN;
-- 排他ロックで現在口座残高を取得
SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
-- 10000円とのこと
                                                            BEGIN;
                                                            -- トランザクション開始後の最初の読み取りでスナップショットを確立、
                                                            -- 同一トランザクション内では、そのスナップショットから読む
                                                            SELECT balance FROM accounts WHERE id = 1;
                                                            -- 10000円とのこと
-- 5000円入金
UPDATE accounts SET balance = 15000 WHERE id = 1;
COMMIT;
                                                            -- ↑のとおり、スナップショットから読む
                                                            SELECT balance FROM accounts WHERE id = 1;
                                                            -- 10000円とのこと

                                                            -- ところが、ロックして読むときはちょっと違う
                                                            SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
                                                            -- 15000円とのこと、A でコミット済の値を読む
                                                            -- 20000円入金
                                                            UPDATE accounts SET balance = 35000 WHERE id = 1;
                                                            COMMIT;
-- 口座残高の確認
SELECT balance FROM accounts WHERE id = 1;
