
-- 追加
ALTER TABLE users ADD COLUMN favorite_number INT DEFAULT 0 NOT NULL;

-- 削除
ALTER TABLE users DROP column favorite_number;

-- 確認
SELECT * FROM users;
DESC users;

-- 変更
ALTER TABLE users MODIFY first_name char(200);

-- 追加例、位置の指定
ALTER TABLE users ADD COLUMN favorite_number INT AFTER favorite_color;

-- 変更例、コメント追加
ALTER TABLE users MODIFY email char(64) COMMENT 'メールアドレス';
