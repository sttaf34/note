# タグの一覧
git tag
git tag -n

# タグの作成
git tag v1.4.0

# ローカルのタグをリモートに反映させる。
git push origin --tags

# タグにチェックアウトする
git checkout refs/tags/v0.0.4

# やっぱり最新の状態に戻る
git checkout master

# タグの削除
git tag -d <tagname>
