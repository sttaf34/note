# ファイル作成して確認
echo "aaa,bbb,ccc" > new.txt
cat new.txt

# trで第一引数を第二引数に置換、文字数を揃える必要がある
cat new.txt | tr ',' '\n' > new.txt
cat new.txt

# pwdの出力は改行がついてるので除去したい、
# 第二引数が空文字列はだめとのことなので、半角スペースで
pwd | tr '\n' ' '
