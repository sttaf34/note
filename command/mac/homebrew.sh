brew update # Homebrew の本体のアップデート
brew doctor # いろいろ診断してくれる
brew list   # インスコ済をリスト表示

brew search jq  # formula があるかを検索
brew install jq # jq をインスコ
brew remove jq  # jq を削除
brew upgrade jq # jq をバージョンアップ

brew tap                      # tap したものの一覧を表示
brew tap beeftornado/rmtree   # 非公式の formula のインストール
brew untap beeftornado/rmtree # 非公式の formula の削除

# 新しい Mac をセットアップするとき
brew bundle --file=~/Projects/dotfiles/Brewfile

# 現在の設定を書き出す
brew bundle dump
brew bundle dump --file=./Brewfile

#
# 整理整頓
#

# 他から依存されてないパッケージを表示
brew leaves

# rmtree は依存先も含めて削除するサブコマンド
# ↑ので表示されたもので、不要そうなものを削除すると良い
brew rmtree autoconf
