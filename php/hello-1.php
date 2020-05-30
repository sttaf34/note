<?php

session_start();

?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
</head>
<body>
<form action="hello-2.php" method="POST">
  ユーザ <input type="text" name="user">
  <br>
  パスワード <input type="password" name="password">
  <br>
  <input type="submit" value="ログイン">
</form>
</body>
</html>
