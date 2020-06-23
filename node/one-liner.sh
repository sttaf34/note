# 出力
node -e 'console.log("Hey!");'

# 標準入力で受け取ったものを出力
echo 'Hello!' | node -e \
  'const stdin = require("fs").readFileSync(0, "utf-8");
   console.log(stdin.trim());'
