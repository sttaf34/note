
-- WHERE IN
-- user_id = 1 AND user_id = 2 AND user_id = 3 をスッキリ書ける
SELECT id, user_id, product_id, date FROM sales
WHERE user_id IN (1, 2, 3)
ORDER BY date
LIMIT 20;

-- WHERE LIKE => % はワイルドカード
SELECT id, email FROM users
WHERE email like '%google%'

-- ORDER BY ASC  => 古い方を先に表示
-- ORDER BY DESC => 新しい方を先に表示
SELECT id, user_id, product_id, date
FROM sales
ORDER BY date;

-- ORDER BY ASC  => 数値が小さい方を先に表示
-- ORDER BY DESC => 数値が大きい方を先に表示
SELECT id, user_id, product_id, date
FROM sales
WHERE date BETWEEN '2019-01-01 00:00:00' AND '2019-01-05 00:00:00'
ORDER BY product_id;

-- OFFSET 20 => 20件飛ばす
SELECT id, user_id, product_id, date FROM sales
WHERE user_id IN (1, 2, 3)
ORDER BY date
LIMIT 20 OFFSET 20;

-- LIMIT の数値分増やしていけば重複なく取っていける
SELECT id, user_id, product_id, date FROM sales
WHERE user_id IN (1, 2, 3)
ORDER BY date
LIMIT 20 OFFSET 40;
