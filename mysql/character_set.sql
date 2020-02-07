
-- 文字コード確認
show variables like "chara%";

-- +--------------------------+----------------------------+
-- | Variable_name            | Value                      |
-- +--------------------------+----------------------------+
-- | character_set_client     | utf8mb4                    |
-- | character_set_connection | utf8mb4                    |
-- | character_set_database   | utf8mb4                    |
-- | character_set_filesystem | binary                     |
-- | character_set_results    | utf8mb4                    |
-- | character_set_server     | utf8mb4                    |
-- | character_set_system     | utf8                       |
-- | character_sets_dir       | /usr/share/mysql/charsets/ |
-- +--------------------------+----------------------------+
-- ↑このようにしとくのが無難らしい

-- --default-character-set=utf8mb4 で影響するのは
-- character_set_client, character_set_connection, character_set_results の3つ
mysql -u root -p --default-character-set=utf8mb4
