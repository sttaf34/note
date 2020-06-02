<?php

session_start();
$_SESSION = array();
session_destroy();

?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
</head>
<body>
  <p>ログアウトしました。<br>
    $_COOKIE → <?php print_r($_COOKIE); ?><br>
    $_SESSION → <?php print_r($_SESSION); ?><br>
  </p>
  <p>
    <a href="index.php">index.php</a>
  </p>
</body>
</html>
