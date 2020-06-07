# history実行結果は↓のような構造になってる
# 1 ls
# 2 pwd
# 3 history

# $0 は行全体
# $1 は1番目のカラム
# スペース区切りで値が入ってる
history | awk '{print $0}'
history | awk '{print $1}'

# 3番目のカラムがない場合は空行が出力される
history | awk '{print $3}'

# 条件判定して表示
history | awk '$1 > 40 {print $0}'
history | awk '$1 == 34 {print $0}'

# 2番めのカラムがない場合は、条件判定して表示しない
history | awk '$3 != "" {print $0}'

# 条件判定は && や || を使用可能
history | awk '$3 != "" && $1 < 10 {print $0}'

# ログとかでめちゃくちゃ結果が多いときは他のコマンドに渡せば良い
history | awk '{print $1}' | less

# パイプで渡されたものを一行づつでなく、
# 複数行の文字列として文字列検索して切り取って表示
history | awk '/150/, /170/'

# find で出力したパスのリストを加工するのにも使ってみた形
find ~/Projects -mindepth 1 -maxdepth 1 -not -name ".*" -type d | \
awk '{print "cd " $0 " && code -a ."}'
