
-- user_id 毎の購入件数を集計
SELECT
  user_id,
  COUNT(id) AS count
FROM sales
GROUP BY user_id;

-- 一定件数以上購入した人だけを表示したい
-- HAVING を使って集計結果に対して条件指定する
SELECT
  user_id,
  COUNT(id) AS count
FROM sales
GROUP BY user_id
HAVING count > 8000;
