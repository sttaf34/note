
# Dockerデプロイのときの流れ
cd ~/Projects/docker-node-mysql/application
heroku login
heroku container:login
heroku container:push web -a sttaf34-docker-node-mysql
heroku container:release web -a sttaf34-docker-node-mysql

# ログ確認
heroku logs -a sttaf34-docker-node-mysql

# 情報確認
heroku config -a sttaf34-docker-node-mysql

# 再起動
heroku restart -a sttaf34-docker-node-mysql
