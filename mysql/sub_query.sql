
-- 'Miller'さんのコメント一覧
SELECT comments.* FROM comments
LEFT JOIN users
ON comments.user_id = users.id
WHERE users.first_name = 'Miller';

-- 使いどころが適切かどうかは置いといて、
-- ↑と同じものをサブクエリで書いてみた形、WHERE内で使用している
SELECT * FROM comments WHERE user_id = (
  SELECT id FROM users WHERE first_name = 'Miller'
);

-- 使いどころが適切かどうかは置いといて、
-- FROM内でサブクエリを使用してみた形
SELECT favorite_red_users.*, scores.score FROM (
  SELECT id, first_name FROM users WHERE favorite_color = 'red'
) AS favorite_red_users
LEFT JOIN scores
ON favorite_red_users.id = scores.user_id;

-- 外側の WHERE で絞り込まれた FROM の特定の列をサブクエリの検索条件にする
SELECT
  (
    SELECT title FROM posts AS sub
    WHERE sub.user_id = main.id LIMIT 1
  ) AS title
FROM users AS main
WHERE height = 184
