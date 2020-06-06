#
# コマンド
#

# 3種類のスコープに分かれて設定されている

# 1.システム設定の確認
git config --system --list

# 2.ユーザ設定の確認
# ~/.gitconfig の中身が出力される
git config --global --list

# 3.プロジェクト設定の確認
# remote の接続先とかが書いてある .git/config が実際のファイル
git config --local --list

# エディタで開いて編集できる、具体的なファイルの場所がわからないときに
git config --global -e
git config --local -e

#
# 設定ファイルの書き方
#

# 現在は設定してないが
# master ブランチにいるときはいろいろ禁止する hooks を用意してある
[init]
  templatedir = ~/Projects/dotfiles/.git_template/
