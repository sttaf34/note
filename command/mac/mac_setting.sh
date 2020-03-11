
# Dockのアプリ側にスペース追加
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Dockのファイル側にスペース追加
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# 再起動で有効化
killall Dock



# スクショの保存場所変更
defaults write com.apple.screencapture location ~/Workspace/

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
