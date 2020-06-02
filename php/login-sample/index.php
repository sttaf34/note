<?php

session_start();

$names = [
  "22" => "Sasaki",
  "23" => "Takahashi",
  "24" => "Hotei",
  "25" => "Tanaka",
  "26" => "Sato"
];

if (isset($_SESSION['id'])) {
  // $id を用いて DB からデータを持ってきた体
  $id = $_SESSION['id'];
  $name = $names[$id];
  $message = "こんにちは {$name} さん";
} else {
  $message = "ログインしてないようです。<a href='login.php'>login.php</a>";
}

?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
</head>
<body>
  <p><?php echo($message); ?></p>
</body>
</html>
