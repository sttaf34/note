
# ハッシュ関数
- 任意のデータから別の値を得るための関数。要約関数とも言う。
- ハッシュ関数から得られた値をハッシュ値、単にハッシュと言う。

# 暗号学的ハッシュ関数
- 次のような性質を持つ必要がある。
- ハッシュ値から元のデータを得ることが事実上不可能であること。
- 原像計算困難性、弱衝突耐性という。
- 同じハッシュ値になるような異なるデータを求めることが事実上不可能であること。
- 強衝突体制という。
- データを少し変えた時、ハッシュ値が大幅に変わり、相関がないように見えること。
- https://ja.wikipedia.org/wiki/暗号学的ハッシュ関数

# アルゴリズム

## MD5
- 「apple」のハッシュ値は「30c6677b833454ad2df762d3c98d2409」
- 「applo」のハッシュ値は「0e889074d32a980e5b11b29d5400d079」
- 元データは似ているが、ハッシュ値は全然違っていて、相関がないように見える。
- 現在では、暗号学的ハッシュ関数としての強度は既に残っていない。

## MD5 by Bash
echo 'apple' | md5sum | awk '{print $1}'

## SHA-1
- 「apple」のハッシュ値は「63be13414db8face6b21467789f4e9da3213b49b」
- 「applo」のハッシュ値は「ebaceca7156e83be138f79d0a18caa9363113d83」
- 「強衝突耐性の突破」が成功されている。セキュリティ目的で新規採用してはダメ。

## SHA-1 by Bash
echo 'apple' | shasum --algorithm 1 | awk '{print $1}'

## SHA-256 by Bash
- apple -> 303980bcb9e9e6cdec515230791af8b0ab1aaa244b58a8d99152673aa22197d0
- applo -> d74ae84e7706ef74bb413f9a3fb581b4dc87eac735622403aebf12b19ebf015a
- SHA-1を改良したのがSHA-2。
- SHA-2には6つのバリエーションがあるが、その1つがSHA-256。
- 暗号学的ハッシュ関数として使って良い。

## SHA-256 by Bash
echo 'apple' | shasum --algorithm 256 | awk '{print $1}'