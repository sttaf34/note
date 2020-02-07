#
docker image pull mysql:5.7

# 命名して起動
# MYSQL_ROOT_PASSWORD が必要と言われる
docker container run --name a_database mysql:5.7

# 一旦削除する
docker container rm a_database

# 環境変数で MYSQL_ROOT_PASSWORD を指定して起動
docker container run --name a_database -e MYSQL_ROOT_PASSWORD=password mysql:5.7

# ポート指定して起動
docker container run --name a_database --rm -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 mysql:5.7

# 起動していることを確認できる
docker container ls

# サーバに入る
docker container exec -it a_database /bin/bash

# テーブル作って、何かしらのデータをインサートする

# 停止する
docker container stop a_database

# 再度起動する
docker container restart a_database

# サーバに入ると、↑でインサートしていたデータが残っていることが確認できる
docker container exec -it a_database /bin/bash
