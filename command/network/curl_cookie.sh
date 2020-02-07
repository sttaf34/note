
# -I -> HTTPレスポンスヘッダーの表示
# -s -> 進捗非表示
curl -sI https://www.google.co.jp/

# cookie はレスポンスヘッダーの中に書かれている
curl -sI https://www.google.co.jp/ | grep set-cookie

# set-cookie:
#   1P_JAR=2020-01-29-11;                   キーと値
#   expires=Fri, 28-Feb-2020 11:26:49 GMT;  有効期限
#   path=/;                                 パス
#   domain=.google.co.jp;                   ドメイン
#   Secure                                  指定するとHTTPS時のみ送信する
