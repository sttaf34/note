# ログイン履歴を確認
last

# ↑の表示されたものより過去のログイン履歴が見たい場合
# 連番の付与されたファイルが過去ログになってる
ls /var/log/wtmp*

# -f => ファイル指定で表示
last -f /var/log/wtmp.1