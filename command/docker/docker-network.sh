
# ネットワークの一覧
docker network ls

# 詳細表示、立ち上がってるサーバとかが見れる
docker network inspect NETWORK_ID

# 削除
docker network rm NETWORK_ID

# イメージ、コンテナ等の数の表示
docker system df

# 使われてないイメージ等の削除
docker system prune -a --volumes
