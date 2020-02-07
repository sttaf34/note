-- カーソルの超基本
delimiter //
CREATE PROCEDURE cursor_test()
BEGIN
  DECLARE cursor_id INT;
  DECLARE cursor_1 CURSOR FOR SELECT id FROM users;

  OPEN cursor_1;

  WHILE 1 DO
    FETCH cursor_1 INTO cursor_id;            -- カーソルを進めつつ
    SELECT * FROM users WHERE id = cursor_id; -- 順番に処理していく
  END WHILE;

  CLOSE cursor_1;
END
//
delimiter ;

-- 実行
CALL cursor_test();

-- 削除
DROP PROCEDURE IF EXISTS cursor_test;
