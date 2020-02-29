
# 環境変数を設定してコマンド実行する
env echo $HOME

# -i -> 環境変数が設定されてない状態でコマンド実行する
# pwd も見つからないとなる、どんな時に使うかはわからない
env -i pwd

# Shebang はインタプリタの指定
#!/bin/sh

# Shebang はインタプリタの指定
# 環境変数を設定して node で実行しろと言っている
#!/usr/bin/env node
