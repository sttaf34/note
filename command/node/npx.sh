
# ちょっと試したいのを気軽に実行できる
# インスコ -> 実行 -> アンインスコされる
npx cowsay Yeah!
npx create-react-app
npx serve

# ローカルにインスコしたコマンドの実行・npx使わない場合
cd ~/Projects/typescript-sample
./node_modules/.bin/ts-node -h

# ローカルにインスコしたコマンドの実行・npx使う場合
cd ~/Projects/typescript-sample
npx ts-node -h
