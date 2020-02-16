
# まだコミットしていない変更を退避する
# - エディタで作業して保存しただけのもの
# - ステージングしたもの
# - 新規で追加したファイル
# -u => 新規で追加されたファイルも stash 対象に含める
git stash -u

# 退避を戻す
git stash pop

# 二個以上の退避も管理できるが、必要になったらば
# https://qiita.com/chihiro/items/f373873d5c2dfbd03250
# https://qiita.com/akasakas/items/768c0b563b96f8a9be9d
