
# 前提
- 「Z = X mod Y」と書いたらば「Z は X を Y で割った余り」を意味する。

# RSAの鍵ペア生成
- いろんな条件のことを考慮して生成する。数学の話になる。
- https://ja.wikipedia.org/wiki/RSA暗号
- 公開鍵による暗号化、秘密鍵による復号の辻褄が合うものが生成される。

- (暗号文) = (平文) ^ E mod N
- (平文) = (暗号文) ^ D mod N
- この辻褄が合うような E, N, D が生成されている。
- E, N が公開鍵
- D が秘密鍵

# 小さな値で実際計算してみる
- https://qiita.com/izuki_y/items/ae36f7e0cdb08a19acb2
- E = 13, N = 2987, D = 2197, 平文 = 33
- 33 ^ 13 % 2987 = 1327, 暗号文 = 1327
- 1327 ^ 2197 % 2987 = 33
- 復号の計算結果が、最初の平文と一緒になっている！
