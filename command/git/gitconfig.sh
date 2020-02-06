
# 3種類のスコープに分かれて設定されている

# 1.システム設定
git config --system --list

# 2.ユーザ設定
# ~/.gitconfig の中身が出力される
git config --global --list

# 3.プロジェクト設定
# remote の接続先とかが書いてあったりする
git config --local --list

# エディタで開いて編集できる、具体的なファイルの場所がわからないときに
git config --local -e
