# シンボリックリンク基本
ln -s <本体のパス> <ショートカット的なものを置きたいパス>

# 例・本体がファイル
ln -s ~/Projects/dotfiles/.bashrc ~/.bashrc

# 例・本体がディレクトリ
ln -s /home/ubuntu/sttaf34.net /var/www/html

# 例
ln -s \
  ~/Projects/note-typescript/node_modules/chromedriver/bin/chromedriver \
  ~/Projects/note-typescript/chromedriver
