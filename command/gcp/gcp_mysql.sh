
# https://wiki.debian.org/MySql
# sudo apt-get install mysql-server が済んでいるとして

#
# サーバ
#

# GCP上でMySQLサーバー起動
sudo /etc/init.d/mysql start

# GCP上でMySQLステータス確認
sudo /etc/init.d/mysql status

# サブコマンド無しだと、サブコマンド一覧が返る
# /etc/init.d/mysql start|stop|restart|reload|force-reload|status|bootstrap
sudo /etc/init.d/mysql

# 実体の場所
cd /var/lib/mysql/

#
# クライアント
#

# コマンドラインのMySQLクライアントで接続
# ユーザとか設定していない場合はこれでルートで入れる
sudo mysql
sudo mysql --show-warnings

# 外部から接続する用としてユーザ作っておく
# - ポートフォワードでつなぐので、localhostで良い
# - IDENTIFIED BY の後ろがパスワード
> CREATE USER 'sttaf34'@'localhost' IDENTIFIED BY 'password';
> GRANT ALL ON sample.* TO 'sttaf34'@'localhost';

# パスワード無しの場合
> CREATE USER 'sttaf34'@'localhost';
> GRANT ALL ON sample.* TO 'sttaf34'@'localhost';

# ユーザ削除
> DROP USER sttaf34@localhost;

# ユーザ確認
> SELECT Host, User FROM mysql.user;
