# 環境変数の一覧を表示
env

# 環境変数に値をセット
# env すると一覧に含まれている
export SUPER_VALUE_X=999

# これだと環境変数でなく、普通の変数
SUPER_VALUE_XXX=777

# 値を表示
echo $SUPER_VALUE_X
echo $SUPER_VALUE_XXX

# -n => 削除
export -n SUPER_VALUE_X

# Shebang はインタプリタの指定
#!/bin/sh

# 環境変数を設定してコマンド実行する
env date

# 環境を設定しないでコマンド実行する、フォーマットが変わることを確認できる
env -i date

# 環境変数を設定して node で実行しろと言っている
#!/usr/bin/env node
