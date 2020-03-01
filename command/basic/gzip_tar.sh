
#
# gzip
#

# 現状を確認
cd ~/Projects/note/command/git
ls -l gitconfig.sh

# 圧縮して gitconfig.sh.gz に変更する
gzip gitconfig.sh

# サイズが変わったことを確認
ls -l gitconfig.sh.gz

# 解凍して gitconfig.sh に戻す
gunzip gitconfig.sh.gz

#
# tar
#

# text ディレクトリをアーカイブ
# c => アーカイブを作成（一つのファイルにまとめる的な意味かと）
# f => アーカイブファイル名の指定
# v => 詳細表示
cd ~/Projects/note
tar cfv text.tar text

# アーカイブを作成し、アーカイブ対象は削除する
tar cfv text.tar text --remove-files

# 中身のファイル一覧の確認
# t => 一覧を表示
tar tf text.tar

# x => アーカイブから展開する
tar xf text.tar

#
# tar.gz
#

# text ディレクトリを text.tar.gz に圧縮
# z -> gzip の指定
cd ~/Projects/note
tar cfvz text.tar.gz text

# text.tar.gz の中身を確認
tar tfvz text.tar.gz

# text.tar.gz を展開する
tar xfvz text.tar.gz
