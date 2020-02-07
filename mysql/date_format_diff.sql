
-- DATE_FORMAT で各日毎の購入者数（のべ）を算出
SELECT
  DATE_FORMAT(date, '%Y-%m-%d') AS ymd,
  COUNT(user_id)
FROM sales
GROUP BY ymd
LIMIT 10;

-- TIMESTAMPDIFF で年齢を算出
SELECT
  first_name,
  TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
FROM users;

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
