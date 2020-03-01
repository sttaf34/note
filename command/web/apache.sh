#
# Ubuntu 18.04.1 LTS (GNU/Linux 4.15.0-1021-aws x86_64)
#

# バージョン確認
apachectl -v

# mod の一覧が置いてるディレクトリ
ls /etc/apache2/mods-available/

# 有効にしている mod の一覧が置いてるディレクトリ
# シンボリックを置くことで有効化にするような仕組みになっている
ls -l /etc/apache2/mods-enabled/

# mod-ssl を有効にする、シンボリックが置かれるということ
a2enmod ssl

# mod-ssl を無効にする、シンボリックが削除されるということ
a2dismod ssl
