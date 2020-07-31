# HTTPレスポンスの表示
curl https://www.google.co.jp/

# -I -> HTTPレスポンスヘッダーの表示
curl -I https://www.google.co.jp/

# HTTPステータスだけ表示
# -s -> 進捗を表示しない
curl -s -I https://www.google.co.jp/ | grep HTTP

# 301 Moved Permanently が返る
curl -s -I http://google.co.jp/ | grep HTTP

# -o -> 出力先の指定
# -o /dev/null/ とすれば捨てる
curl -s -o /dev/null/ https://www.google.co.jp/

# -L リダイレクトを追従する
# HTTP/1.1 301 Moved Permanently
# HTTP/1.1 200 OK
# と推移が表示される
curl -s -I -L http://google.co.jp/ | grep HTTP

# -w 欲しい情報を指定する
# http_code, size_download, いろいろある
curl -s -o /dev/null/ https://www.google.co.jp/ -w '%{http_code}\n'
curl -s -o /dev/null/ https://www.google.co.jp/ -w '%{size_download}\n'

# リダイレクト先URLを表示
curl -s -L -o /dev/null/ https://google.co.jp/ -w '%{url_effective}\n'

# -m -> タイムアウト秒数指定
curl -m 2 https://sttaf34-netlify-functions.netlify.app/.netlify/functions/no-response
