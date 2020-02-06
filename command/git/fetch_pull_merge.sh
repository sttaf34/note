
# リモートの変更状況一式をダウンロードする、マージはしない
# すごい数のブランチがある場合にも全部ダウンロードされる
git fetch

# マージする前に差分を見る、通常はGitLensで見てる
# origin/master が新たに変更されたので差分を見ているということ
git diff master origin/master

# master に origin/master をマージ
git merge master origin/master
