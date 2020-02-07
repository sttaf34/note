--
-- 外部結合 LEFT OUTER JOIN
--

-- posts が全部表示されるので、記事一覧を出すときとか
SELECT * FROM posts
LEFT OUTER JOIN comments
ON posts.id = comments.post_id

-- comments が全部表示されるので、コメント一覧を出すときとか
SELECT * FROM comments
LEFT OUTER JOIN posts
ON comments.post_id = posts.id
