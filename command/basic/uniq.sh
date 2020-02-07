
# コマンド履歴から通し番号を除去したものを出力
history | head -20 | awk '{print $2}'

# uniq で重複行を削除する
# uniq は sort 済でないと機能しない
history | head -20 | awk '{print $2}' | sort | uniq

# -c -> 数を数える
history | head -20 | awk '{print $2}' | sort | uniq -c

# さらに awk で条件指定で絞り込む
history | head -20 | awk '{print $2}' | sort | uniq -c | awk '$1 > 1 {print $0}'
