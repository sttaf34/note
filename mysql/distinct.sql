
-- 各月毎の購入者数（のべ）
SELECT
  DATE_FORMAT(date, '%Y-%m') AS ym,
  COUNT(user_id)
FROM sales
GROUP BY ym;

-- DISTINCT の使い所
-- 各月毎の購入者数（のべではない）
SELECT
  DATE_FORMAT(date, '%Y-%m') AS ym,
  COUNT(DISTINCT user_id)
FROM sales GROUP BY ym;

-- 各日毎の購入者数（のべ）
SELECT
  DATE_FORMAT(date, '%Y-%m-%d') AS ymd,
  COUNT(user_id)
FROM sales
WHERE date BETWEEN '2018-01-01 00:00:00' AND '2018-01-31 23:59:59'
GROUP BY ymd;
