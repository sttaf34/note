<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $username = $_POST['username'];
  $password = $_POST['password'];

  if ($username === "sttaf34" && $password !== "") {
    // 多くの場合、DB に user テーブルがあったりする
    // ユーザ名とパスワードを用いて user.id を特定する
    // ここでは、ユーザ名と適当なパスワードで特定できたことにする
    $id = random_int(22, 26);

    // $_SESSION はクッキーの PHPSESSID（セッションID）毎に値が保存されている
    // ここで代入しておくと、
    // 同じ PHPSESSID であれば、別のページに遷移した時も利用できる
    $_SESSION['id'] = $id;

    header("Location: index.php");
    exit();
  }
}

?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
</head>
<body>
<form action="login.php" method="POST">
  ユーザ名 <input type="text" name="username">
  <br>
  パスワード <input type="password" name="password">
  <br>
  <input type="submit" value="ログイン">
</form>
</body>
</html>
