# xmllint で xpath 指定して取得
curl -s https://example.com/ | xmllint --html --xpath "//h1/text()" -
