
# 使用量表示
# -h -> 単位を適切に
# -s -> パスを指定
du -h -s ~/*

# 5GB以上のディレクトリを表示、単位がGBで表示される
# -d 階層
# -x マウントされてるものは含めない、外付けHDDとか
sudo du -h -x -d 2 ~/

# 例
sudo du -sh /.*
 25M  /.DocumentRevisions-V100
580M  /.MobileBackups
 11G  /Applications
5.1G  /Library
 ︙

# 例
sudo du -sh /*
 11G  /Applications
5.1G  /Library
  0B  /Network
 ︙

# 単一ディレクトリの容量チェック
sudo du -sh /Applications
 11G  /Applications
