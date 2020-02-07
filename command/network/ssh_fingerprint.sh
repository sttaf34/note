
# 鍵指紋を表示
# -l -> 指紋を表示
# -v -> 指紋のアスキーアートを表示
# -f -> ファイル指定
ssh-keygen -lv -f ~/Projects/secret/.ssh/id_rsa

# 初めてSSHでログインするときに表示されるメッセージ
#
# The authenticity of host '34.82.218.149 (34.82.218.149)' can't be established.
# ECDSA key fingerprint is SHA256:uBm9YtaJ+I2x2CdTP6xt/sT3bJ/YzUDWiaRZ6G7F4L4.
# Are you sure you want to continue connecting (yes/no/[fingerprint])?
#
# ↑に書いてある指紋は、ログインしようとしているサーバの以下のパスの鍵のもの
(gcp) ssh-keygen -lv -f /etc/ssh/ssh_host_ecdsa_key.pub

# ここの中にいくつかの種類の鍵ペアがデフォルトで置いてある
(gcp) cd /etc/ssh

# 初めてSSHでログインするときに表示されるメッセージに対して、
# 普段、何も考えずに yes にしてしまっているが、
# きっちりやるんであれば、指紋の一致も見る必要があったりはする
