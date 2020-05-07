-- 日時を DATE_FORMAT で日付に丸め、各日毎ののべ購入者数を算出
SELECT
  DATE_FORMAT(date, '%Y-%m-%d') AS ymd,
  COUNT(user_id)
FROM sales
GROUP BY ymd
LIMIT 10;

-- 誕生日と現在日時から TIMESTAMPDIFF で年齢を算出
SELECT
  first_name,
  TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
FROM users;

-- 本日を基準に過去や未来のいろんな日付を計算する例
-- いずれも 2020-02-01 のように年月日な形で返る
SELECT CURRENT_DATE();                             -- 本日
SELECT LAST_DAY(CURRENT_DATE());                   -- 今月末日
SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY);   -- 昨日
SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH); -- 1ヶ月前
SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY);   -- 明日
SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 1 YEAR);  -- 1年後

-- 今月の初日
SELECT DATE_FORMAT(CURRENT_DATE(), '%Y-%m-01');

-- 特定月の初日
SELECT DATE_FORMAT(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH), '%Y-%m-01');

-- 月だけ欲しい
SELECT DATE_FORMAT(CURRENT_DATE(), '%m');

-- フォーマットの指定詞
-- https://dev.mysql.com/doc/refman/5.6/ja/date-and-time-functions.html


-- 現在日時より一定時間（5ヶ月）過去を検索条件に使う
SELECT id, user_id, product_id, indexed_datetime FROM sales 
WHERE indexed_datetime > (NOW() - INTERVAL 5 MONTH);

-- いろいろ単位を指定できる
-- SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, YEAR
SELECT id, user_id, product_id, indexed_datetime FROM sales 
WHERE indexed_datetime > (NOW() - INTERVAL 25 WEEK);
