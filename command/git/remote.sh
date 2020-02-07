
# 現在設定の一覧
# -v -> 詳細
git remote -v

# origin という名前で git@bitbucket.org:sttaf34/sttaf34.net.git を登録する
git remote add origin git@bitbucket.org:sttaf34/sttaf34.net.git

# 登録することで
# git push git@bitbucket.org:sttaf34/sttaf34.net.git master
# ↓
# git push origin master
# で済むようになる

# 接続先変更
git remote set-url origin git@github.com:sttaf34/sttaf34.net.git
