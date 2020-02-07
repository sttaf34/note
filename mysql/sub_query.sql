
-- 'Miller'さんのコメント一覧
SELECT comments.* FROM comments
LEFT JOIN users
ON comments.user_id = users.id
WHERE users.first_name = 'Miller';

-- 使いどころが適切かどうかは置いといて、
-- ↑と同じものをサブクエリで、WHERE内で使用
SELECT * FROM comments WHERE user_id = (
  SELECT id FROM users WHERE first_name = 'Miller'
);

-- 使いどころが適切かどうかは置いといて、FROM内でサブクエリを使用
SELECT temp_users.*, scores.score FROM (
  SELECT id, first_name FROM users WHERE favorite_color = 'red'
) AS temp_users
LEFT JOIN scores
ON temp_users.id = scores.user_id;
