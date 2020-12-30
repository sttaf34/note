# バージョン確認
yarn -v

# まとまっている
# https://qiita.com/morrr/items/558bf64cd619ebdacd3d
# https://qiita.com/rubytomato@github/items/1696530bb9fd59aa28d8

# package.json の dependencies に入るようにパッケージ追加
yarn add typescript

# package.json の devDependencies に入るようにパッケージ追加
yarn add --dev eslint
yarn add --dev ts-node-dev

# パッケージ削除
yarn remove moment

# package.json に基づいてパッケージ追加、git clone 直後等に使う
yarn install

# package.json のバージョンを無視して全パッケージを更新
yarn upgrade --latest

# バージョン指定してのパッケージの更新
yarn upgrade chromedriver@79.0.0

# package.json のバージョンを無視してのパッケージの更新
yarn upgrade chromedriver --latest

# 脆弱性のあるパッケージの検出
yarn audit

# 古いパッケージの一覧を表示
yarn outdated

# GitHub 上の Dependabot alerts に出ているものを調べる
yarn why PACKAGE

# グローバルにインストール
# グローバルへのインストールは npm でやっているではある
yarn global add windows-build-tools
