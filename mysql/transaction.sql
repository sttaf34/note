
--
-- トランザクションで UPDATE する
--
BEGIN;                                     -- トランザクション開始
UPDATE users SET height = 175 WHERE id = 3 -- 大丈夫な UPDATE
SELECT * FROM users;                       -- 確認
COMMIT;                                    -- 確定する
SELECT * FROM users;                       -- 念の為に確認

--
-- トランザクションでロールバックする
--
BEGIN;                         -- トランザクション開始
UPDATE users SET height = 175; -- WHERE を書き忘れてしまった！
SELECT * FROM users;           -- やばい！
ROLLBACK;                      -- 戻せる
SELECT * FROM users;           -- ロールバックを確認
