
# Dockのアプリ側にスペース追加
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Dockのファイル側にスペース追加
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# 再起動すると有効になる
killall Dock

# スクショの保存場所変更
defaults write com.apple.screencapture location ~/Workspace/

# スクショのファイル名変更
defaults write com.apple.screencapture name ""

# スクショ設定の有効化
killall SystemUIServer
