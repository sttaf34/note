# インストールできるバージョンの一覧を表示
nodenv install -l
nodenv install -l | tail -n 10

# バージョン指定でインストール
# https://nodejs.org/ja/
# LTSの推奨版を使っておくと無難かも
nodenv install 12.14.0
nodenv rehash

# 利用できるバージョン一覧と現在利用中を表示
nodenv versions

# グローバルで利用するバージョンの変更
nodenv global 12.14.0

# nodenv で特定のバージョンをインスコするときに yarn もインスコするプラグイン
# yarn は brew でなくてこちらを使おう
https://github.com/pine/nodenv-yarn-install

# プロジェクトのルートに .node-version を置いとくと、
# そのプロジェクト内で nodist すると確認できる
