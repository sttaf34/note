
# ちょっと試したいのを気軽に実行できる
# インスコ -> 実行 -> アンインスコされる
npx cowsay Yeah!
npx create-react-app

# ローカルにインスコしたコマンドの実行・npx使わない場合
cd ~/Projects/note-typescript
./node_modules/.bin/ts-node -h

# ローカルにインスコしたコマンドの実行・npx使う場合
cd ~/Projects/note-typescript
npx ts-node -h
