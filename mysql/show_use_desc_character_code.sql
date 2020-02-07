--
-- データベース操作
--

-- データベースの一覧を表示
SHOW databases;

-- 現在選択されているDBを表示
select database();

-- DBの作成
create database sample;

-- CREATE DATABASE したときのSQL文が確認できる
SHOW create database sample;

-- sampleというDBを選択
use sample;

-- DBを削除
drop database sample;

--
-- 全体に関わること
--

-- 現在ログインしているユーザを表示
select user();

-- 全ユーザを表示
select Host, User, Password from mysql.user;

-- 文字コード情報の表示
SHOW variables like "chara%";

-- 何かのSQLを実行した時にWarningが出たら確認できる
SHOW warnings;

--
-- テーブル情報表示
--

-- テーブルの一覧を表示
SHOW TABLES;

-- usersテーブルのカラムの情報を表示
DESC users;

-- CREATE TABLE したときのSQL文が確認できる
SHOW CREATE TABLE users;

-- usersテーブルのカラムの情報を詳しく表示
SHOW FULL COLUMNS FROM users;

-- インデックス表示
SHOW INDEX FROM users;
