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

DROP TABLE IF EXISTS members;
CREATE TABLE members (
  id INT PRIMARY KEY,
  group_id INT NOT NULL,
  INDEX index_group_id(group_id)
);
INSERT INTO
  members (id, group_id)
VALUES
  (1, 35), (2, 42);

--
-- デッドロック
--

-- A                                                        -- B
-- id = 1, id = 2 の group_id を入れ替える処理を試みる
BEGIN;
SELECT * FROM users WHERE id = 1 FOR UPDATE;
                                                            BEGIN;
                                                            SELECT * FROM users WHERE id = 2 FOR UPDATE;
SELECT * FROM users WHERE id = 2 FOR UPDATE;
-- 先行して B でレコードロックされているので時が止まる
                                                            SELECT * FROM users WHERE id = 1 FOR UPDATE;
                                                            -- デッドロック検出される
