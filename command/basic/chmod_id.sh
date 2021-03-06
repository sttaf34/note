
# x が 1 -> 実行権限
# w が 2 -> 書き込み権限
# r が 4 -> 読み込み権限
# 左から、所有ユーザ・所有グループ・その他の順番
chmod 755 test.sh

# ls -l の時の表示、頭のdはディレクトリを示す
# 644 -> -rw-r--r--
# 755 -> drwxr-xr-x

# 実行権限付与系
chmod u+x test.sh # ユーザに実行権限付与
chmod g+x test.sh # グループに実行権限付与
chmod o+x test.sh # その他に実行権限付与
chmod +x test.sh  # 全体に実行権限付与
chmod -x test.sh  # 全体から実行権限削除

# ログインしているユーザ名・そのユーザのプライマリグループ・所属中グループの表示
id # uid=501(kawa) gid=20(staff) groups=20(staff), .....

# ユ グ そ    ユ所  グ所
# ｜ ル の    ｜有  ル有
# ザ ｜ 他    ザ    ｜
#    プ             プ
-rw-r--r--  1 kawa  staff  752 Apr  7 04:23 040603041396721048
drwxr-xr-x  5 kawa  staff  170 Apr  6 10:40 MyWork

# 644とかで指定した際のグループの値は
# ファイルの所有グループに対する指定ということになる
