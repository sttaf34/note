# インストールできるバージョンの一覧を表示
nodist dist
nodist dist | tail -n 10

# バージョン指定でインストール
# https://nodejs.org/ja/
# LTSの推奨版を使っておくと無難かも
nodist + 12.4.0

# 利用できるバージョン一覧と現在利用中を表示
nodist

# グローバルで利用するバージョンの変更
nodist global v12.4.0

# プロジェクトのルートに .node-version を置いとくと、
# そのプロジェクト内で nodist すると確認できる
