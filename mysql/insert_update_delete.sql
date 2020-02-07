
-- INSERT
INSERT INTO tags
  (id, title)
VALUES
  (1, '日記'),
  (2, 'お知らせ');

-- email カラムに NOT NULL 制約が付いているのでエラーになる
INSERT INTO users (first_name, last_name, birthdate, email, height)
VALUES ('Tetsuo', 'Tetsu', '1979-05-22', NULL, 180);

-- UPDATE
UPDATE posts SET title = '無題', content = '' WHERE id = 1

-- DELETE
DELETE FROM users WHERE id = 3

-- SELECT で取得した結果を INSERT
INSERT INTO comments (user_id, post_id, content) (
  SELECT user_id, post_id, content FROM comments
);

-- INSERT INTO ON DUPLICATE KEY UPDATE
-- INSERT を試みて UNIQUE 制約に引っかかるようであれば UPDATE してくれる
-- 具体的には、users.email に 'aaa@example.com' が既にいれば UPDATE する
-- users.email に 'aaa@example.com' がいなければ INSERT する
INSERT INTO users (first_name, last_name, birthdate, email, height)
VALUES ('Tetsuo', 'Tetsu', '1979-05-22', 'aaa@example.com', 180)
ON DUPLICATE KEY UPDATE first_name = 'Nishio', height = 190;
