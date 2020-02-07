
-- DELIMITER // <= 終端文字を変更
-- DELIMITER ;  <= 終端文字を通常に戻す

-- プロシージャ定義
DELIMITER //
CREATE PROCEDURE proc1()
BEGIN
  SELECT VERSION();
END;
//
DELIMITER ;

-- 引数を取るプロシージャ定義
DELIMITER //
CREATE PROCEDURE proc2(IN number INT)
BEGIN
  SELECT number;
END;
//
DELIMITER ;

-- 実行
CALL proc1();
CALL proc2(35);

-- 消去
DROP PROCEDURE IF EXISTS proc1;
DROP PROCEDURE IF EXISTS proc2;

-- プロシージャの一覧を確認
SELECT
  ROUTINE_SCHEMA, /* ストアドプロシージャがあるデータベース */
  ROUTINE_NAME,   /* ストアドプロシージャの名前 */
  ROUTINE_TYPE    /* プロシージャとファンクションのどちらかを示す */
FROM
  information_schema.ROUTINES
WHERE 
  ROUTINE_TYPE = 'PROCEDURE'; /* プロシージャのみ抽出 */
