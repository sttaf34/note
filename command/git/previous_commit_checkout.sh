
#
# 全体を過去の状態に戻す
#

# 戻りたい commit のハッシュを特定
cd ~/Projects/note && git log

# checkout で戻る、頭数桁を指定すれば大丈夫
git checkout a22ba2

# やっぱりHEADに戻る
git checkout master

#
# 特定のファイルを過去の状態に戻す
#

# 指定したハッシュのコミットの指定ファイルをもってくる
# ステージされた状態になっている（git status で確認できる）
git checkout 3777a0 ~/Projects/dotfiles/.bashrc

# アンステージ状態にして、さらに全く変更してない状態に戻す
git unstage ~/Projects/dotfiles/.bashrc
git checkout ~/Projects/dotfiles/.bashrc
