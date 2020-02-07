-- 単純に件数を数える
SELECT COUNT(id) FROM sales WHERE user_id = 1;

-- GROUP BY で分割しつつ、その分割されたグループごとに条件指定で数える
SELECT
  COUNT(product_id = 1 OR NULL),
  COUNT(product_id = 2 OR NULL),
  COUNT(product_id = 3 OR NULL)
FROM sales
GROUP BY user_id;

-- 単純に合計する
SELECT SUM(price) FROM sales
LEFT JOIN products
ON sales.product_id = products.id
WHERE user_id = 1;

-- GROUP BY で分割しつつ、その分割されたグループごとに条件指定で合計する
SELECT
  user_id,
  SUM(CASE WHEN product_id = 1 THEN price ELSE 0 END) AS 'SUM(product_id = 1)',
  SUM(CASE WHEN product_id = 2 THEN price ELSE 0 END) AS 'SUM(product_id = 2)',
  SUM(CASE WHEN product_id = 3 THEN price ELSE 0 END) AS 'SUM(product_id = 3)'
FROM sales
LEFT JOIN products
ON sales.product_id = products.id
GROUP BY user_id;
