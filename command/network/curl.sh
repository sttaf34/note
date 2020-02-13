
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

# ログ表示用のサーバ起動
cd ~/Projects/typescript-sample && yarn ts-node src/server/server_post.ts

# -X -> HTTPメソッドの指定
# -d -> パラメータの指定
curl -X POST http://localhost:5000 -d "name=kawa&age=38"

# -H -> HTTPヘッダの追加
curl -X POST -H "Content-Type: application/json" -d '{"name":"kawa"}' localhost:5000

# 'content-type': 'application/x-www-form-urlencoded' になる
curl -X POST http://localhost:5000 -d 'json={"name":"kawa"}'
