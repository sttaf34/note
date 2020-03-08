-- https://blog.amedama.jp/entry/2015/09/19/012009
-- https://dev.mysql.com/doc/refman/5.6/ja/innodb-lock-modes.html

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
-- 問題の起きる例
--

-- A                                                        -- B
BEGIN;
-- 現在口座残高を取得
SELECT balance FROM accounts WHERE id = 1;
-- 10000円とのこと
                                                            BEGIN;
                                                            -- 現在口座残高を取得
                                                            SELECT balance FROM accounts WHERE id = 1;
                                                            -- 10000円とのこと
-- 5000円入金
UPDATE accounts SET balance = 15000 WHERE id = 1;
                                                            -- 20000円入金
                                                            UPDATE accounts SET balance = 30000 WHERE id = 1;
                                                            -- ↑即座に実行されない
COMMIT;
                                                            -- A が COMMIT されたので時は動き出す
                                                            COMMIT;
-- 口座残高の確認
SELECT balance FROM accounts WHERE id = 1;
-- 25000円入金されて、35000円になっているはずが、20000円だけ入金されて、30000円になっている！

--
-- どのように対応するか（排他ロックを使って）
--

-- A                                                        -- B
BEGIN;
-- 排他ロックで現在口座残高を取得
SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
-- 10000円とのこと
                                                            BEGIN;
                                                            -- 排他ロックで現在口座残高を取得
                                                            SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
                                                            -- ↑即座に実行されない
-- 5000円入金
UPDATE accounts SET balance = 15000 WHERE id = 1;
COMMIT;
                                                            -- A が COMMIT されたので時は動き出す
                                                            -- 現在口座残高は15000円とのこと
                                                            -- 20000円入金
                                                            UPDATE accounts SET balance = 35000 WHERE id = 1;
                                                            COMMIT;
-- 口座残高の確認
SELECT balance FROM accounts WHERE id = 1;
-- 25000円入金されて、35000円になっていて、正しい！

-- トランザクションAで、あるインデックスが排他ロックされている状態で、
-- トランザクションBが、同じインデックスを排他ロックしようとすると、トランザクションAのロックが開放されるまで待機する

--
-- どのように対応するか
-- 今回の問題であれば、ロックを使わずとも対応できる
--

-- A                                                        -- B
BEGIN;
-- 現在口座残高を取得
SELECT balance FROM accounts WHERE id = 1;
-- 10000円とのこと
                                                            BEGIN;
                                                            -- 現在口座残高を取得
                                                            SELECT balance FROM accounts WHERE id = 1;
                                                            -- 10000円とのこと
-- 5000円入金
UPDATE accounts SET balance = balance + 5000 WHERE id = 1;
                                                            -- 20000円入金
                                                            UPDATE accounts SET balance = balance + 20000 WHERE id = 1;
                                                            -- ↑即座に実行されない
COMMIT;
                                                            -- A が COMMIT されたので時は動き出す
                                                            COMMIT;
-- 口座残高の確認
SELECT balance FROM accounts WHERE id = 1;
-- 25000円入金されて、35000円になっている
