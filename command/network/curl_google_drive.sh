#
# スコープ https://www.googleapis.com/auth/drive.file の場合
#

# アクセストークンを取得し、変数 ACCESS_TOKEN にセットしてあるという前提
# https://developers.google.com/drive/api/v3/reference/about/get
curl 'https://www.googleapis.com/drive/v3/about?fields=user' \
  --header "Authorization: Bearer $ACCESS_TOKEN"

# ファイルの一覧取得
# https://developers.google.com/drive/api/v3/reference/files/list
curl 'https://www.googleapis.com/drive/v3/files' \
  --header "Authorization: Bearer $ACCESS_TOKEN"

# ファイルのアップロード
# https://developers.google.com/drive/api/v3/manage-uploads
# https://stackoverflow.com/questions/45878753/
# 自分の Google Drive のホーム上にファイルが確認できる
curl -X POST \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  -F "metadata={name: 'sample.txt'};type=application/json;charset=UTF-8" \
  -F "file=@sample.txt;type=text/plain" \
  "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart"

# https://developers.google.com/drive/api/v3/reference/files/get
# ファイルのアップロードのレスポンスに id が含まれているので、それを指定する
# 標準出力にメタデータが表示される
curl -L "https://www.googleapis.com/drive/v3/files/$FILE_ID" \
  --header "Authorization: Bearer $ACCESS_TOKEN"

# https://developers.google.com/drive/api/v3/manage-downloads
# 標準出力にファイルの中身が表示される
curl -L "https://www.googleapis.com/drive/v3/files/$FILE_ID?alt=media" \
  --header "Authorization: Bearer $ACCESS_TOKEN"

# 画像ファイルのアップロード
# 自分の Google Drive のホーム上にファイルが確認できる
# 2回実行すると、上書きされずに別なファイルになる
curl -X POST \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  -F "metadata={name: 'Icon.png'};type=application/json;charset=UTF-8" \
  -F "file=@Icon.png;type=image/png" \
  "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart"


# cd ~/Projects/note-typescript && yarn ts-node src/server/server-post.ts
# ログ観察用サーバで HTTP リクエストを確認してみた
curl -X POST \
  -F "metadata={name: 'sample.txt'};type=application/json;charset=UTF-8" \
  -F "file=@sample.txt;type=text/plain" \
  "http://localhost:7000"

# --------------------------73023618d8f6e843
# Content-Disposition: form-data; name="metadata"
# Content-Type: application/json;charset=UTF-8
#
# {name: 'sample.txt'}
# --------------------------73023618d8f6e843
# Content-Disposition: form-data; name="file"; filename="sample.txt"
# Content-Type: text/plain
#
# abcdefg
#
# --------------------------73023618d8f6e843--

# https://developers.google.com/identity/protocols/oauth2/native-app
# リフレッシュトークンを使って、アクセストークンの再取得
curl -X POST https://oauth2.googleapis.com/token \
  --data "refresh_token=$REFRESH_TOKEN" \
  --data "client_id=$CLIENT_ID" \
  --data "grant_type=refresh_token"

# https://developers.google.com/identity/protocols/oauth2#expiration
# リフレッシュトークンの期限に関して書いてある


#
# スコープ https://www.googleapis.com/auth/drive.appdata の場合
#

# ファイルの一覧取得
# https://developers.google.com/drive/api/v3/reference/files/list
curl 'https://www.googleapis.com/drive/v3/files?spaces=appDataFolder' \
  --header "Authorization: Bearer $ACCESS_TOKEN"

# ファイルのアップロード
# https://developers.google.com/drive/api/v3/appdata
# Google Drive の設定のアプリの管理のところでファイルの容量だけ確認できる
# 実行の都度新しいファイルが作られる
curl -X POST \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  -F "metadata={name: 'sample.txt', parents: ['appDataFolder'] };type=application/json;charset=UTF-8" \
  -F "file=@sample.txt;type=text/plain" \
  "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart"

# ファイルの ID を指定することで上書きする
curl -X PATCH \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  -F "metadata={name: 'sample.txt', parents: ['appDataFolder'] };type=application/json;charset=UTF-8" \
  -F "file=@sample.txt;type=text/plain" \
  "https://www.googleapis.com/upload/drive/v3/files/$FILE_ID?uploadType=multipart"
