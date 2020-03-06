
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
# 設定変更後、別ターミナルで ssh でログインできることを確認すること

#
# そのほか設定
#

# ホスト名変更
sudo hostnamectl set-hostname aws
