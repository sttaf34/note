<?php

session_start();

$user = $_POST["user"];
$password = $_POST["password"];

if ($user === "sttaf34" && $password !== "") {
  // 多くの場合、DB に user テーブルがあったりする
  // ユーザ名とパスワードを用いて user.id を特定する
  // ここでは、ユーザ名と適当なパスワードで特定できたことにする
  var_dump("ログインできました");

  // $_SESSION はクッキーの PHPSESSID（セッションID）毎に値が保存されている
  // ここで代入しておくと、
  // 同じ PHPSESSID であれば、別のページに遷移した時も利用できる
  $_SESSION['user'] = $user;

  // 通常、ユーザを特定できる ID を保存しておいて、
  // 別のページでは、その ID を元に DB から値を取得するような形になる
  // $_SESSION['user_id'] = 437892143;
} else {
  die("ログインできませんでした");
}

?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
</head>
<body>
  <a href="./hello-3.php">進む</a>
</body>
</html>
