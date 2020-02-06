
# Dockのアプリ側にスペース追加
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Dockのファイル側にスペース追加
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# 再起動すると有効になる
killall Dock
