
-- LENGTH で文字数カウント
SELECT id, first_name FROM users ORDER BY LENGTH(first_name);

-- 文字列連結
SELECT CONCAT('Hello ', first_name, '!') FROM users;

-- SUBSTR(column_name, start_index, end_index) で文字列切り取り
-- index は 1 始まり、end_index は省略すると最後まで
SELECT SUBSTR(first_name, 2) FROM users;
SELECT SUBSTR(first_name, 1, 4) FROM users;  -- 先頭から4文字となる
