
# まとまってる
https://qiita.com/standard-software/items/2ac49a409688733c90e7

#
# グローバル
#

# バージョン確認
npm -v

# グローバルにインストールし、パスを通す
npm install -g serve
nodenv rehash

# グローバルにインスコしたものの一覧
# 階層を指定しないととんでもない数になっている
npm ls -g --depth=0

# 削除
npm uninstall -g serve

# 更新
npm update -g serve

#
# プロジェクト内は yarn でやるようにしている
#

# 対話でカレントディレクトリにpackage.jsonを生成
npm init

# 全部YESで同上
npm init -y

# プロジェクト下で以下を実行すれば、
# プロジェクト下のpackage.jsonのdependenciesにも追記される
npm install typescript
npm install react-helmet
npm install react-router
npm install minireset.css
npm install gatsby-transformer-remark
npm install gatsby-plugin-typescript

# プロジェクト下で以下を実行すれば、
# プロジェクト下のpackage.jsonのdevDependenciesにも追記される
# これは開発時のみ使う系のパッケージ
npm install --save-dev eslint
npm install --save-dev prettier

# ↑の省略系
npm i -D @typescript-eslint/parser
npm i -D eslint-config-prettier

# git pull してきた場合、node_modules 下は空っぽ
# 以下を実行すれば、package.jsonの内容でinstallする
npm install

# node_modules下を再インスコ
npm rebuild
