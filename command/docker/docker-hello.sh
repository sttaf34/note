# https://hub.docker.com/

# バージョン確認
docker version

docker image pull httpd:2.4 # タグ指定して、イメージのダウンロード
docker image pull httpd     # デフォルトのタグlatestで、イメージのダウンロード
docker image ls             # docker pull でダウンロードしたイメージの一覧
docker image rm REPOSITORY  # イメージの削除

# -t -> イメージの命名
# Dockerfileを元にイメージをビルド
docker image build -t sttaf34/mysql:5.7 .

# コンテナ起動、localhost:8080 でアクセスできる
# -p -> Macとコンテナのポートマッピング
docker container run -p 8080:80 httpd

# --rm -> コンテナ停止時にコンテナ削除
docker container run -p 8080:80 --rm httpd

# -d -> バックグラウンドでコンテナ起動
docker container run -p 8080:80 --rm -d httpd

# busyboxは最小限の機能を備えた非常に軽量なOS」とのこと
# -i -> コンテナの標準入力をホストの標準入力に接続
# -t -> コンテナの標準出力をホストの標準出力に接続
docker container run -it --rm busybox:1.31

# -e -> 環境変数を設定する
docker container run -it --rm -e A_PATH=/root busybox:1.31

# 起動中のコンテナに入る
docker container exec -it CONTAINER_ID /bin/bash

docker container ls                # 現在動いているコンテナの一覧
docker container ls -a             # 停止中も含めてコンテナの一覧
docker container stop CONTAINER_ID # コンテナ停止
docker container rm CONTAINER_ID   # コンテナ削除

# 全削除
docker container ls -aq | xargs docker container rm
docker image ls -aq | xargs docker image rm
