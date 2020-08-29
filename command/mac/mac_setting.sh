# Dockのアプリ側にスペース追加
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Dockのファイル側にスペース追加
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# 再起動で有効化
killall Dock



# スクショの保存場所変更
defaults write com.apple.screencapture location ~/Desktop/

# スクショのファイル名変更
defaults write com.apple.screencapture name ""

# スクショ設定の有効化
killall SystemUIServer



# .DS_Store ファイルを作らない or 作る
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.desktopservices DSDontWriteNetworkStores false

# Finder のタイトルバーに絶対パスの表示
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true

# 再起動で有効化
killall Finder



# キーリピートの速度設定
# ログアウトしてログインすると反映される
defaults write -g InitialKeyRepeat -int 13
defaults write -g KeyRepeat -float 1.8

# キーリピートの速度設定の確認
# 環境設定での最速値は InitialKeyRepeat => 15 KeyRepeat => 2
defaults read -g InitialKeyRepeat
defaults read -g KeyRepeat

# これだと早すぎた
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
