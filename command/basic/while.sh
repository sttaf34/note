# findの結果をループで処理する、
# lineは変数名、名前は何でも良いが、慣習的にlineが多いっぽい
find ~/Projects -maxdepth 1 -type d | while read line
do
  echo $line
done

# 特定のディレクトリ下のリポジトリの現在状況を一覧表示
# これだとリモートの状況を考慮してないので不完全、fetchすると良いかも
find ~/Projects -maxdepth 1 -type d | while read line
do
  cd $line && pwd | tr '\n' ' ' && __git_ps1 && echo ''
done

# コマンド部分だけを抽出
# while の仮引数みたいな部分（number command）は複数個の値を取れるのを利用
history | tail -100 | while read number command
do
  echo $command
done | less

# 特定のディレクトリ下のスネークケースをケバブケースにリネーム
find . -name "*.ts" \
     -not -path "*/node_modules/*" \
     -not -path "*/.git/*" \
     -not -path "*/__tests__/*" \
     -type f | grep "_" | sed -e "s@\./@@g" | while read path
do
  # echo で一度確認してみるのが安心
  # echo "$path" "$(echo $path | sed -e 's@_@-@g')";
  mv "$path" "$(echo $path | sed -e 's@_@-@g')";
done
