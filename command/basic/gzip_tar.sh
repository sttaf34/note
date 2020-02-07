# 現状を確認
cd ~/Projects/note/command/git
ls -l gitconfig.sh

# 圧縮して gitconfig.sh.gz に変更する
gzip gitconfig.sh

# サイズが変わったことを確認
ls -l gitconfig.sh.gz

# 解凍して gitconfig.sh に戻す
gunzip gitconfig.sh.gz

# Texts ディレクトリをアーカイブ
# c => アーカイブを作成（一つのファイルにまとめる的な意味かと）
# f => アーカイブファイル名の指定
cd ~/Projects/note
tar cf text.tar text

# 中身のファイル一覧の確認
# t 一覧を表示
tar tf text.tar

# x アーカイブから展開する
tar xf text.tar
