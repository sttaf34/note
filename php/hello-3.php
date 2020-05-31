<?php

session_start();

// hello-2.php でログイン成功時に $_SESSION に値を代入しているので
// 同じ PHPSESSID であれば、このページでも山椒できる
var_dump($_SESSION['user']);

// $user_id = $_SESSION['user_id'];
// ↑この ID を元にユーザを特定し、いろいろなデータを表示したりする

?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
</head>
<body>
</body>
</html>
