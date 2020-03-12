
# ダミーデータ作成サービス => https://www.mockaroo.com/

# setup
use sample;

# users

## CREATE
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name CHAR(64) NOT NULL,
  last_name CHAR(64) NOT NULL,
  birthdate DATE NOT NULL,
  email CHAR(64) NOT NULL UNIQUE,
  height FLOAT NOT NULL,
  favorite_color ENUM('red', 'yellow', 'green', 'blue') NOT NULL DEFAULT 'red',
  is_deleted BIT(1) NOT NULL DEFAULT 0 COMMENT '1(true): 削除済',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'ユーザ';

## INSERT
INSERT INTO users
  (id, first_name, last_name, birthdate, email, height, favorite_color)
VALUES
  (1, 'Miller', 'Scholey', '1977-03-28', 'mscholey0@google.cn', 194, 'red'),
  (2, 'Ketti', 'Peirpoint', '1979-10-11', 'kpeirpoint1@de.vu', 171, 'yellow'),
  (3, 'Ursuline', 'Sieur', '1981-05-10', 'usieur2@printfriendly.com', 184, 'green'),
  (4, 'Sonny', 'Ingerith', '1975-03-31', 'singerith3@google.com.hk', 146, 'blue'),
  (5, 'Kylynn', 'Nelle', '1976-10-23', 'knelle4@un.org', 200, 'red'),
  (6, 'Dolf', 'Crowdy', '1992-07-28', 'dcrowdy5@hatena.ne.jp', 180, 'red'),
  (7, 'Josias', 'Swaisland', '1994-09-20', 'jswaisland6@mapquest.com', 170, 'green'),
  (8, 'Darb', 'MacQueen', '1972-10-23', 'dmacqueen7@bluehost.com', 143, 'blue'),
  (9, 'Hilly', 'Colin', '1973-01-18', 'hcolin8@paypal.com', 157, 'blue'),
  (10, 'Lorin', 'Lotwich', '1992-01-17', 'llotwich9@yolasite.com', 165, 'green');

# posts

## CREATE
DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL COMMENT 'users.id 記事を書いたユーザ',
  title CHAR(64) NOT NULL,
  content TEXT NOT NULL COMMENT '本文',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'ユーザが投稿した記事';

## INSERT
INSERT INTO posts
  (id, user_id, title, content)
VALUES
  (1, 1, '今日の日記', 'すごい暑かった。'),
  (2, 2, '昨年のまとめ', '充実していた。'),
  (3, 2, '今年の振り返り', 'まずまずよくやっている'),
  (4, 3, '襟裳岬', '結構流行りました'),
  (5, 1, '今日の天気', 'すごい晴れていて、38度くらいはありそうです。');

# comments

## CREATE
DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL COMMENT 'users.id コメントを書いた人',
  post_id INT NOT NULL COMMENT 'posts.id コメントが付いた記事',
  content TEXT NOT NULL COMMENT '本文',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT foreign_key_user_id
    FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT '記事につくコメント';

## INSERT
INSERT INTO comments
  (id, user_id, post_id, content)
VALUES
  (1, 1, 1, '補足です。32度でした。'),
  (2, 1, 2, 'それは何よりでしたね。'),
  (3, 3, 2, 'こんばんは'),
  (4, 8, 3, 'Hello, World!'),
  (5, 9, 4, 'Good morning!'),
  (6, 10, 2, 'My name is nantoka.');

# scores

## CREATE
DROP TABLE IF EXISTS scores;
CREATE TABLE IF NOT EXISTS scores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL COMMENT 'users.id 点数を付けたユーザ',
  post_id INT NOT NULL COMMENT 'posts.id 点数を付けられた記事',
  score INT NOT NULL COMMENT '点数',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY user_id_post_id (user_id, post_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT '記事についた点数';

## INSERT
INSERT INTO scores
  (id, user_id, post_id, score)
VALUES
  (1, 1, 1, 38),
  (2, 1, 2, 25),
  (3, 3, 1, 65),
  (4, 1, 4, 92);

# tags

## CREATE
DROP TABLE IF EXISTS tags;
CREATE TABLE IF NOT EXISTS tags (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title CHAR(64) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT '記事のタグ';

## INSERT
INSERT INTO tags
  (id, title)
VALUES
  (1, '日記'),
  (2, 'お知らせ'),
  (3, '天気予報');

# tag_posts

## CREATE
DROP TABLE IF EXISTS post_tags;
CREATE TABLE IF NOT EXISTS post_tags (
  id INT PRIMARY KEY AUTO_INCREMENT,
  post_id INT NOT NULL COMMENT 'posts.id',
  tag_id INT NOT NULL COMMENT 'tags.id',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY user_id_post_id (post_id, tag_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'postsとtagsの中間テーブル';

## INSERT
INSERT INTO post_tags
  (post_id, tag_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 1),
  (3, 2),
  (4, 2),
  (5, 2),
  (5, 3);


# products

## CREATE
DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name CHAR(64) NOT NULL,
  price INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT '商品';

## INSERT
INSERT INTO products
  (id, name, price)
VALUES
  (1, 'プロテイン', 4500),
  (2, 'ダンベル', 8800),
  (3, 'バーベル', 10500),
  (4, 'リストラップ', 2000),
  (5, 'ベルト', 8000),
  (6, '体重計', 25800),
  (7, '鉄棒', 104000),
  (8, 'タオル', 900);

# sales

## CREATE
CREATE TABLE IF NOT EXISTS sales (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL COMMENT '購入者',
  product_id INT NOT NULL,
  indexed_datetime DATETIME NOT NULL COMMENT '購入日時',
  indexless_datetime DATETIME NOT NULL COMMENT '購入日時',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX indexed_datetime_index(indexed_datetime)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'ユーザの購入履歴';
