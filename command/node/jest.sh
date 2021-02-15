# package.json の jest の設定に基づいて、すべてのテストを実行
yarn jest

# src/hello-test-world.test.ts
# __tests__/hello-test-world.test.ts
# のように、プロジェクト内にファイルがあったとする

# ファイルを指定して実行
yarn jest __tests__/hello-test-world.test.ts

# コミットしてないやつだけ実行してくれる
yarn jest -o
