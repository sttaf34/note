
# OSI参照モデルの階層
7. アプリケーション層   HTTP
6. プレゼンテーション層
5. セッション層
4. トランスポート層     TCP UDP
3. ネットワーク層       IP ICMP
2. データリンク層       Ethernet
1. 物理層               ケーブルの規格や形状

# HTTPでデータを送信する時の流れ
- わかりやすい図 -> https://www.infraexpert.com/study/networking3.html
- 送信時は上の層から順番にヘッダを付与していく。カプセル化。
- 送信時の最後に、物理層で電気信号に変換する。
- 受信時の最初に、物理層で電気信号からビット列に変換する。
- 受信時は、下の層から順番にヘッダを取り外していく。非カプセル化。

# ファイアウォールの例

## ModSecurity
- OSSのWAF(Web Application Firewall)
- 主に第7層で動作する。

## iptables
- 主に第4層、第3層の条件でパケットフィルタリングなどを行う。
