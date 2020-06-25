# 変数に代入して使用
TEXT='This is an apple.'
echo $TEXT
echo ${TEXT}

# これだと cd が動作する
PATH_1='../'
cd $PATH_1

# チルダ絡み
PATH_2='~/'
cd $PATH_2      # これはチルダが展開されないので cd できない
eval cd $PATH_2 # これはチルダが展開されて cd が動作する

# チルダ展開して変数に格納
PATH_3=`eval 'echo ~/'`
echo $PATH_3

# これだとチルダ展開されない
eval 'echo $PATH_2'

# これと、、、
ssh gcp "ls ~/documents"

# これは同じように動く、文字列の中で展開している形
PATH_4='~/documents'
ssh gcp "ls ${PATH_4}"

# これだと展開されない、シングルコーテなので
ssh gcp 'ls ${PATH_4}'
