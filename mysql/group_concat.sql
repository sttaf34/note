
-- 投稿と投稿についたコメントを取得
SELECT
  posts.id,
  posts.user_id,
  posts.title,
  comments.content AS comment
FROM posts
LEFT OUTER JOIN comments
ON posts.id = comments.post_id;

-- 一つの投稿が一行になるように取りたいとなったらば
SELECT
  posts.id,
  posts.user_id,
  posts.title,
  GROUP_CONCAT(comments.content)
FROM posts
LEFT OUTER JOIN comments
ON posts.id = comments.post_id
GROUP BY posts.id;
