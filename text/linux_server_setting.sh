
# 環境
# Amazon Lightsail
# Ubuntu 18.04.1 LTS (GNU/Linux 4.15.0-1021-aws x86_64)

#
# 作業ユーザの追加と sudo 権限
#

# ユーザの一覧を見て作業用ユーザがないなら追加する
# Lightsail だと始めから作業用ユーザ（ubuntu）が用意されてた
cat /etc/passwd

# ユーザの追加
useradd sttaf34

# どのグループに sudo 権限があるかを確認
sudo visudo

# グループの一覧を見て、作業ユーザに sudo 権限があるかを確認
cat /etc/group

#
# 作業ユーザでログインする用の公開鍵を設置
#

# 鍵を用意して ~/.ssh/authorized_keys に追記する

# パーミッション
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

#
# sshd_config の設定変更
#

# ↓のように設定変更する
vi /etc/ssh/sshd_config

# ポートの変更
# Port XXXXX
# ルートでログインできなくする
# PermitRootLogin no
# パスワードでログインできなくする
# PasswordAuthentication no

# sshd_config の設定を更新
sudo /etc/init.d/ssh restart

# ufw でファイアウォールの設定も必要
# Lightsail コンパネのファイアウォールの設定も必要
#
# 設定変更後、別ターミナルで ssh でログインできることを確認する
# 設定を間違って、二度と入れなくなってしまう可能性があるので

#
# msmtp
#

# インスコ
sudo apt-get install msmtp msmtp-mta

# 設定ファイルをコピーして編集
sudo cp /usr/share/doc/msmtp/examples/msmtprc-system.example /etc/msmtprc
sudo vi /etc/msmtprc

# # Set default values for all following accounts.
# defaults
# syslog         on
# tls            on
# tls_trust_file /etc/ssl/certs/ca-certificates.crt
# auth           on
# syslog         LOG_MAIL
# tls_starttls   off
#
# # Gmail
# account      gmail
# host         smtp.gmail.com
# port         465
# from         sttaf34@gmail.com
# user         sttaf34
# passwordeval "cat ~/.gmail.password"

# 送信テスト
sudo echo "hello system msmtp" | msmtp -a gmail sttaf34@gmail.com

#
# logwatch
#

# インスコ
sudo apt-get install logwatch

# 自動的に cron で動くように設定される
/etc/cron.daily/00logwatch

# 設定ファイルをコピーして編集
sudo cp /usr/share/logwatch/default.conf/logwatch.conf /etc/logwatch/conf/
sudo vi /etc/logwatch/conf/logwatch.conf

# 自分宛てに送信する設定
# mailer = "/usr/bin/msmtp -a gmail sttaf34@gmail.com"

# 送信テスト
sudo logwatch --output mail

#
# そのほか設定
#

# ホスト名変更
sudo hostnamectl set-hostname aws

# ログインのログ確認
cat /var/log/auth.log | grep sshd
