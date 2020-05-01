# GUI で言うと「システム環境設定 > ネットワーク」で表示している一覧が表示される
networksetup -listallnetworkservices

# 「詳細 > プロキシ > SOCKプロキシ」のチェックの切り替え
# "Wi-Fi" の文字列は↑の一覧で並んでいるものを指定する
sudo networksetup -setsocksfirewallproxystate Wi-Fi on
sudo networksetup -setsocksfirewallproxystate Wi-Fi off
