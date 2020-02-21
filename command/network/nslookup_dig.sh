#
# nslookup -> DNSサーバに問い合わせ、結果を加工して表示するコマンド
#

# ドメイン名に対応するIPアドレスを確認、正引き
nslookup www.yahoo.co.jp

# DNSサーバを指定して、ドメイン名に対応するIPアドレスを確認
# 8.8.4.4 -> Googleが提供しているDNSサーバ
# https://ja.wikipedia.org/wiki/Google_Public_DNS
nslookup www.yahoo.co.jp 8.8.4.4

# IPアドレスに対応するドメイン名を確認、逆引き
nslookup 8.8.4.4

#
# dig -> DNSサーバに問い合わせ、結果を表示するコマンド
#

#
dig www.sttaf34.net
