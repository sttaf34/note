
# unixtime to datetime
date -d @1581415200

# フォーマット
# 指定詞 -> https://ja.wikipedia.org/wiki/Date_(UNIX)
date -d @1581415200 +"%Y-%m-%d %H:%M:%S"

# datetime to unixtime
date -d "2020-02-11 19:00:00" +%s

# 現在時刻 to unixtime
date +%s
