
# origin の指している先を表示
git remote -v

# ブランチ指定は、左がローカル、右がリモート
git push origin master:master

# ブランチ コマンド省略系 => 省略じゃない形
# (master) git push origin => git push origin master:master
# (branch) git push origin => git push origin branch:branch

# まず使わないが、
# 作業用として分岐したブランチをマスターに直接プッシュすることも可能
# (branch) git push origin branch:master
