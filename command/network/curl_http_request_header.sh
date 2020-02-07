
# HTTPリクエストをそのまま表示してくれるサーバ起動
cd ~/Projects/typescript-sample && yarn ts-node src/server/show_request_header.ts

# -H -> HTTPリクエストヘッダの追加
curl -s \
  -H "Accept-Charset: utf-8" \
  -H "Accept-Language: ja" \
  localhost:6400
