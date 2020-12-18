# コマンド

## lintを実行
yarn eslint src/App.tsx

## src下の全ファイルでlintを実行
yarn eslint src/**/*.tsx

## 拡張子指定
yarn eslint --ext .ts,.tsx src/**

## 使われている設定を出力
yarn eslint --print-config src/App.tsx > eslint.json

## React 使う場合の一式インストール
yarn add --dev \
  eslint prettier \
  @typescript-eslint/eslint-plugin @typescript-eslint/parser \
  eslint-config-prettier eslint-plugin-prettier eslint-plugin-import \
  eslint-plugin-jsx-a11y  eslint-plugin-react eslint-plugin-react-hooks \
  eslint-config-airbnb

## React 使わない場合の一式インストール
yarn add --dev \
  eslint prettier \
  @typescript-eslint/eslint-plugin @typescript-eslint/parser \
  eslint-config-prettier eslint-plugin-prettier eslint-plugin-import \
  eslint-config-airbnb-base

# 設定の値
- off   0
- warn  1
- error 2

# 各パッケージごとのメモ

## 前提
- 「ルール」と「ルールの設定」がある
- プラグインは「ルール」を定義している
- コンフィグは「ルールの設定」を用意してくれている

## eslint-plugin-import
- github.com/benmosher/eslint-plugin-import
- import export に関するルールを定義している

## eslint-plugin-jsx-a11y
- github.com/gaearon/eslint-plugin-jsx-a11y
- JSX のアクセシビリティに関するルールを定義している
- eslint-plugin-jsx-a11y/tree/master/src/rules がルールの定義

## eslint-plugin-react
- github.com/yannickcr/eslint-plugin-react
- React に関するルールを定義している
- eslint-plugin-react/tree/master/lib/rules がルールの定義

## eslint-plugin-react-hooks
- github.com/facebook/react/tree/master/packages/eslint-plugin-react-hooks
- React Hooks に関するルールを定義している
- plugins: ["@typescript-eslint", "react-hooks", "prettier"] <= 設定に追加する

## eslint-config-airbnb
- オススメの「ルールの設定」を用意してくれている
- github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb
- eslint-plugin-jsx-a11y, eslint-plugin-react, eslint-plugin-react-hooks が対象
- 内部で eslint-config-airbnb-base を読み込んでいる

## eslint-config-airbnb-base
- 大量のオススメの「ルールの設定」を用意してくれている（React 関連を除く）
- github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb-base
- eslint-plugin-import や ESLint の標準のルールが対象

### 「"extends": "airbnb"」が「ルールの設定」をしてくれる「ルール」の範囲
- eslint-plugin-jsx-a11y
- eslint-plugin-react
- eslint-plugin-react-hooks
- eslint-plugin-import
- github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb-base
- かなり広い範囲ということ

## eslint-plugin-jest
- github.com/jest-community/eslint-plugin-jest
- Jest に関するルールを定義している
- github.com/jest-community/eslint-plugin-jest/tree/master/docs/rules にある
- 「ルールの設定」も用意してくれている
- github.com/jest-community/eslint-plugin-jest/blob/master/src/index.ts にある

## eslint-plugin-prettier
- github.com/prettier/eslint-plugin-prettier
- Prettier に関するルールを定義している
- eslint-plugin-prettier.js が具体的なそれ

## eslint-config-prettier
- github.com/prettier/eslint-config-prettier
- ESLint から Prettier を使う際にぶつからないための「ルールの設定」
- index.js が具体的なそれ

## @typescript-eslint/eslint-plugin
- github.com/typescript-eslint/typescript-eslint/tree/master/packages/eslint-plugin
- 他のプラグインの名前に揃えるならば eslint-plugin-typescript ってこと
- TypeScript に関するルールを定義している

## @typescript-eslint/parser
- ESLint に TypeScript を理解させるためのもの
- github.com/typescript-eslint/typescript-eslint/blob/master/docs/getting-started/linting/README.md#configuration

# まとめ

## 結局 extends, plugins をどう設定するか

### TypeScript
extends: [
  "airbnb-base",
  "plugin:@typescript-eslint/recommended",
  "prettier",
  "prettier/@typescript-eslint",
]
plugins: ["@typescript-eslint", "prettier"]

### TypeScript, React
extends: [
  "airbnb",
  "airbnb/hooks",
  "plugin:@typescript-eslint/recommended",
  "prettier",
  "prettier/@typescript-eslint",
  "prettier/react",
]
plugins: ["@typescript-eslint", "react-hooks", "prettier"]

### TypeScript, Jest
extends: [
  "airbnb-base",
  "plugin:@typescript-eslint/recommended",
  "plugin:jest/recommended",
  "prettier",
  "prettier/@typescript-eslint",
]
plugins: ["@typescript-eslint", "prettier"]

### TypeScript, React, Jest
extends: [
  "airbnb",
  "airbnb/hooks",
  "plugin:@typescript-eslint/recommended",
  "plugin:jest/recommended",
  "prettier",
  "prettier/@typescript-eslint",
  "prettier/react",
]
plugins: ["@typescript-eslint", "react-hooks", "prettier"]
