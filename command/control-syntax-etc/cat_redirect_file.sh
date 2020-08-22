# ファイルの閲覧
cat scratch.md

# ファイルを2つ指定すれば連続で表示される
cat scratch.md scratch.md

# 左側の複数のファイルを連結して、右側のファイルを作成 or 上書き
cat scratch.md scratch.md > new.md

# ワイルドカードでも連結できる
cat *.md > new.md

# 左側の標準出力を右側のファイルの末尾に追記、ファイルがなければ作成
cat .gitignore >> new.md
