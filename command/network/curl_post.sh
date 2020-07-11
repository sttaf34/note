#
# POST
#

# ログ表示用のサーバ起動
cd ~/Projects/typescript-sample && yarn ts-node src/server/server_post.ts

# -X -> HTTPメソッドの指定
# -d -> パラメータの指定
curl -X POST http://localhost:5000 -d "name=kawa&age=38"

# -H -> HTTPヘッダの追加
curl -X POST -H "Content-Type: application/json" -d '{"name":"kawa"}' localhost:5000

# 'content-type': 'application/x-www-form-urlencoded' になる
curl -X POST http://localhost:5000 -d 'json={"name":"kawa"}'

# ヒアドキュメントで JSON を渡してみる
curl -H 'Content-Type: application/json; charset=utf-8' \
  -X POST https://sttaf34-netlify-functions.netlify.app/.netlify/functions/index \
  -d @- << EOF
'{"name":"sttaf34"}'
EOF
  
#
# ファイルアップロード
#

# ファイルアップロードを受け付けるサーバ起動
cd ~/Projects/note-express/ejs-file-upload && yarn develop

# アップロードする
# -F -> ファイルの指定
# この API は <input name="file"> を受け付けるようになっているので
# 「file=@./Icon.png」の「file」はそれを指定しているような形
cd ~/Projects/note/image/
curl -X POST -F file=@./Icon.png http://localhost:10300
