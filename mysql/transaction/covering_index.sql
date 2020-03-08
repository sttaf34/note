/*

【パターンい】
主キーを WHERE にして走査した場合、主キーで該当するものが見つかると、
そこには「主キーと全データ」が一緒に収まっているので、そのデータを取得する。
クラスタインデックスという。

【パターンろ】
セカンダリインデックスが使われて検索される場合、
セカンダリインデックスで該当するものが見つかると、
そこには「セカンダリインデックスと主キー」が一緒に収まっている。
で、主キーが特定できたので、【パターンい】でデータを取得するという流れになる。

【パターンは】
セカンダリインデックスを使って検索、インデックスの設定の関係で、
そこには「セカンダリインデックスと必要なデータ」が一緒に収まっていた。
なので、セカンダリインデックスの走査だけでデータ取得が完了。
この【パターンは】のようにすることを Covering Index と呼ぶ。IOが減って効率化。
ちなみに InnoDB の話であって、MyISAM は違う構造とのこと。

【図】
http://nippondanji.blogspot.com/2010/10/innodb.html
https://techlife.cookpad.com/entry/2017/04/18/092524

 */

-- 【パターンい】
SELECT COUNT(id) FROM sales WHERE id BETWEEN 135 AND 21000;

-- 【パターンろ】
SELECT COUNT(user_id) FROM sales
WHERE indexed_datetime BETWEEN '2017-12-01 00:00:00' AND '2017-12-31 23:59:59';

--【パターンは】セカンダリインデックスには主キーが一緒に収まっている
-- ↑と同じ検索条件だが、主キーの走査が無い分速いはず
SELECT COUNT(id) FROM sales
WHERE indexed_datetime BETWEEN '2017-12-01 00:00:00' AND '2017-12-31 23:59:59';

-- 【パターンろ】のクエリを Covering Index を使うようにしてみる
ALTER TABLE sales ADD INDEX index_user_datetime(user_id, indexed_datetime);
SHOW INDEX FROM sales;
ALTER TABLE sales DROP INDEX index_user_datetime;
