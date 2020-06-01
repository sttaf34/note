#
# Ubuntu
#

# unixtime を渡すと「Tue Feb 11 10:00:00 UTC 2020」なフォーマットで出力
#
date -d @1581415200

# unixtime をフォーマット指定して出力
# 指定詞 -> https://ja.wikipedia.org/wiki/Date_(UNIX)
date -d @1581415200 +"%Y-%m-%d %H:%M:%S"

# 日時を渡すと unixtime で出力
date -d "2020-02-11 19:00:00" +%s

# 現在 unixtime を出力
date +%s

#
# Mac
#

# 現在 unixtime を出力
date +%s

# 現在年月日を出力 2020-06-01
date +%F

# 現在年月日を出力 2020/06/01
date +%x
