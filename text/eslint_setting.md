
# コマンド

## lintを実行
yarn eslint src/App.tsx
## src下の全ファイルでlintを実行
yarn eslint src/**/*.tsx
## 使われている設定を出力
yarn eslint --print-config src/App.tsx > eslint.json

# 環境設定
yarn add --dev \
  eslint prettier \
  @typescript-eslint/eslint-plugin @typescript-eslint/parser \
  eslint-config-airbnb eslint-config-prettier eslint-plugin-import \
  eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react \
  eslint-plugin-react-hooks

- .eslintrcは既存のプロジェクトから持ってくる
- 困ったら、それぞれの公式のドキュメントを見ながら進める。

## ESLint使用
https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb

## TypeScript使用
https://github.com/typescript-eslint/typescript-eslint/tree/master/packages/parser
https://github.com/typescript-eslint/typescript-eslint/tree/master/packages/eslint-plugin

## Prettier使用
https://github.com/prettier/prettier
https://github.com/prettier/eslint-config-prettier
https://github.com/prettier/eslint-plugin-prettier

# 参考URL

## .eslintrcの各項目の説明
https://numb86-tech.hatenablog.com/entry/2018/09/17/185100
