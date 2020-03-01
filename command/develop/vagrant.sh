# バージョン確認
vagrant version

# OSのインストール
# 一覧 -> https://app.vagrantup.com/boxes/search
vagrant box add ubuntu/bionic64 --box-version 20181129.0.0

# カレントにVagrantfileを作成、add と同じ名前を指定するっぽい
mkdir -p ~/Servers/ubuntu_bionic64
cd ~/Servers/ubuntu_bionic64
vagrant init ubuntu/bionic64

# サーバ起動
cd ~/Servers/ubuntu_bionic64
vagrant up

# http://matthew.hatenadiary.jp/entry/2016/12/14/235834
# https://qiita.com/0ta2/items/69c2378600bf8adaac5c

# sshで接続
vagrant ssh

# ブロンプトの設定変えといた方が良いかも
# export PS1="\[\e[1;31m\][\w]\[\e[00m\]\n\$ "

# サーバ停止
vagrant halt

# 再起動
vagrant reload
