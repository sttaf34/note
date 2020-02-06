
# コマンド

## lintを実行
node_modules/eslint/bin/eslint.js src/App.tsx
## src下の全ファイルでlintを実行
node_modules/eslint/bin/eslint.js src/**/*.tsx
## 使われている設定を出力
node_modules/eslint/bin/eslint.js --print-config src/App.tsx > test.json

# 環境設定
・公式のドキュメントを見ながら進めるのが良さげ。
・個人開発なので、適度に自分ルールを追加して快適に。セミコロンとか。

## ESLint使用
https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb
{"extends": "airbnb"} を追記して、
--print-config すると、細々したことが設定されたのが確認できる。

## TypeScript使用
https://github.com/typescript-eslint/typescript-eslint/tree/master/packages/parser
https://github.com/typescript-eslint/typescript-eslint/tree/master/packages/eslint-plugin

## Prettier使用
https://github.com/prettier/prettier
https://github.com/prettier/eslint-config-prettier
https://github.com/prettier/eslint-plugin-prettier

## まとめ
・インストールして.eslintrcを変更すれば動く
・npm i typescript
・npm i -D @typescript-eslint/eslint-plugin @typescript-eslint/parser
・npm i -D eslint-config-airbnb eslint-config-prettier eslint-plugin-import
・npm i -D eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react
・npm i -D prettier
・.eslintrcは既存のプロジェクトから持ってくる
・tsconfig.jsonは既存のプロジェクトから持ってくる

# 参考URL

## .eslintrcの各項目の説明
https://numb86-tech.hatenablog.com/entry/2018/09/17/185100
