
-- 単純 CASE 式
-- ラベル付けみたいな感じ
SELECT
  first_name,
  CASE favorite_color
    WHEN 'red'    THEN '赤'
    WHEN 'yellow' THEN '黄'
    WHEN 'green'  THEN '緑'
    WHEN 'blue'   THEN '青'
    ELSE NULL
  END AS japanese_color_name
FROM users;

-- 検索 CASE 式
-- users.height を特定の条件でラベル付けしてのカウント
SELECT
  CASE
    WHEN height > 175 THEN 'tall'
    WHEN height BETWEEN 150 AND 175 THEN 'medium'
    WHEN height < 150 THEN 'short'
    ELSE NULL
  END AS height_type,
  COUNT(id)
FROM users
GROUP BY height_type;

-- IF でも同様なことができるが、拡張性に欠けるかも
SELECT
  if (height > 165, 'tall', 'short') AS height_type,
  COUNT(id)
FROM users
GROUP BY height_type;

-- 曜日ごとで件数のカウント
SELECT
  CASE WEEKDAY(indexed_datetime)
    WHEN 0 THEN '月'
    WHEN 1 THEN '火'
    WHEN 2 THEN '水'
    WHEN 3 THEN '木'
    WHEN 4 THEN '金'
    WHEN 5 THEN '土'
    WHEN 6 THEN '日'
    ELSE NULL
  END AS week,
  COUNT(id)
FROM sales
GROUP BY week
