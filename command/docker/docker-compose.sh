
# docker-compose.yml を元にコンテナ起動
docker-compose up

# コンテナ停止
docker-compose down

# -p -> プロジェクト名指定してコンテナ起動
# docker-compose.yml 内の services の名前を「db」とかの
# 一般的な名前にしていて、それが被るとエラーになる
docker-compose -p project_x up

# コンテナに COPY するファイルを編集し、docker-compose up しただけだと、
# キャッシュが使われてしまって反映されてないっぽいので、一度 build し直す
docker-compose build --no-cache

# 起動してるサーバに入る
# application は docker-compose.yml で定義している名前
docker-compose exec application bash

# 起動しているサーバ内でコマンド実行
# application は docker-compose.yml で定義している名前
docker-compose exec application yarn eslint

# -f -> docker-compose.yml 以外のファイルを指定
docker-compose -f docker-compose-circleci.yml up

# .env が展開された docker-compse.yml を確認
docker-compose config
