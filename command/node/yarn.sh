# バージョン確認
yarn -v

# まとまっている
# https://qiita.com/morrr/items/558bf64cd619ebdacd3d
# https://qiita.com/rubytomato@github/items/1696530bb9fd59aa28d8

# package.json の dependencies に入るようにインスコ
yarn add typescript

# package.json の devDependencies に入るようにインスコ
yarn add --dev eslint
yarn add --dev ts-node-dev

# グローバルにインスコ
yarn global add windows-build-tools

# yarn.lock に基づいてインスコ
yarn install

# パッケージのアップグレード
yarn upgrade chromedriver
yarn upgrade chromedriver@79.0.0
yarn upgrade selenium-webdriver
yarn upgrade webdriver

# パッケージ削除
yarn remove moment
