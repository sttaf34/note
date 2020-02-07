
-- 前提:salesテーブルに90万件程度のデータが入ってる
--      クエリキャッシュはオフの状態

-- https://dev.mysql.com/doc/refman/5.6/ja/query-cache-configuration.html
SHOW VARIABLES LIKE '%query_cache%';  -- クエリキャッシュを確認
SET GLOBAL query_cache_size=0;        -- クエリキャッシュのサイズ変更
SET GLOBAL query_cache_type=0;        -- クエリキャッシュ無効化

SELECT * FROM sales WHERE indexed_datetime = "2018-06-18 12:23:28";   -- 速い！
SELECT * FROM sales WHERE indexless_datetime = "2018-06-18 12:23:28"; -- 遅い！

-- インデックスの確認
SHOW INDEX FROM sales;

--
-- EXPLAIN
-- http://nippondanji.blogspot.com/2009/03/mysqlexplain.html
--

-- EXPLAIN > type > const
-- PRIMARY KEY or UNIQUE KEY が使われた時で最速とのこと
EXPLAIN SELECT * FROM sales WHERE id = 4384;

-- EXPLAIN > type > eq_ref
-- PRIMARY KEY or UNIQUE KEY で JOIN した時
EXPLAIN
  SELECT * FROM sales
  LEFT OUTER JOIN users
  ON sales.user_id = users.id
  WHERE indexed_datetime = "2018-06-18 12:23:28";

-- EXPLAIN > type > ref
-- PRIMARY KEY or UNIQUE KEY 以外のインデックス使用で等価検索の時
EXPLAIN SELECT * FROM sales WHERE indexed_datetime = "2018-06-18 12:23:28";

-- EXPLAIN > type > range
-- PRIMARY KEY or UNIQUE KEY 以外のインデックス使用で範囲検索の時
EXPLAIN
  SELECT * FROM sales
  WHERE indexed_datetime BETWEEN "2018-06-18 00:00:00" AND "2018-08-18 00:00:00";

-- EXPLAIN > type > index
-- フルインデックススキャン、SQLの例が見つからないが、基本遅い

-- EXPLAIN > type > all
-- フルテーブルスキャン、全ての行を見てしまっているので遅い
EXPLAIN SELECT * FROM sales WHERE indexless_datetime = "2018-06-18 12:23:28"
