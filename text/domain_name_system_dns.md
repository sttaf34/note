
# DNS
- Domain Name System の略
- インターネット上のドメイン名とIPアドレスの対応を管理しているデータベース

# DNSサーバ
- DNSの名前解決（ドメイン名からIPアドレスを特定）機能が実装されたサーバ

# 正引き
- DNSを使って、ドメイン名に対応するIPアドレスを求めること。

# 逆引き
- DNSを使って、IPアドレスに対応するドメイン名を求めること。

# コマンド
~/Projects/note/command/network/nslookup_dig.sh

# DNSレコードの例

## A
- キーがドメイン、値がIPアドレス
- 正引きに利用される
- sttaf34.netlify.com -> 134.209.106.40
- sttaf34.net -> 104.198.14.52

## NS
- キーがドメイン、値がDNSサーバ

## AAAA
- キーがドメイン値がIPv6

## CNAME
- キーがドメイン、値もドメイン
- www.sttaf34.net -> sttaf34.netlify.com

## TXT
- キーがドメイン、値は文字列
- サイトの所有権を示すのに使われる

## PTR
- キーがIPアドレス、値がドメイン
- 逆引きに利用される
