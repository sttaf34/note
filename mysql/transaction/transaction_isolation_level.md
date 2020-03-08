
# トランザクション処理中に起きうる問題
- ダーティリード、ファジーリード、ファントムリード等がある。
- 以下で具体的なSQLを使って説明。

## サンプルテーブル scores
| id | score |
|  1 |    11 |
|  2 |    22 |
|  3 |    33 |

## ダーティリード

### トランザクションA
BEGIN;
UPDATE scores SET score = 99 WHERE id = 1;

### トランザクションB
BEGIN;
SELECT score FROM scores WHERE id = 1;
ここでコミット前の値である「99」が取れてしまう。
コミット前のデータを読み取ってしまうのがダーティリード。

## ファジーリード

### トランザクションA
BEGIN;
SELECT score FROM scores WHERE id = 1; // ここでは「11」が取れる

### トランザクションB
BEGIN;
UPDATE scores SET score = 99 WHERE id = 1;
COMMIT;

### トランザクションA
SELECT score FROM scores WHERE id = 1; // ここでは「99」が取れる
同じトランザクション中であるが、別の値が取れてしまった。
これが、ファジーリード（ノンリピータブルリード）。

## ファントムリード

### トランザクションA
BEGIN;
SELECT count(id) FROM scores; // 3が取れる

### トランザクションB
BEGIN;
INSERT INTO scores (id, score) VALUES (4, 44);
COMMIT;

### トランザクションA
SELECT count(id) FROM scores; // 4が取れる
同じトランザクション中であるが、新たにデータが増えてしまった。
これがファントムリード。

# トランザクション分離レベル
- トランザクション分離レベルの設定によって、起こる問題が異なる。

## 対応表
| 分離レベル       | ダーティ | ファジー | ファントム |
| Read Uncommitted |    ✖    |    ✖    |    ✖      |
| Read Committed   |    ○    |    ✖    |    ✖      |
| Repeatable Read  |    ○    |    ○    |    ✖      |
| Serializable     |    ○    |    ○    |    ○      |
