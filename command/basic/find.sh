# 構造
# find ディレクトリ・検索条件・アクション

# カレント下階層・ファイル名・表示
find . -name '*.sh' -print

# カレント下階層・ファイル名・表示（-printがデフォルトなので省略）
find . -name '*.sh'

# あるディレクトリの下階層・ファイルのみ・表示
find ~/Projects/Documents/Commands/ -type f

# あるディレクトリの下階層・ディレクトリのみ・表示
find ~/Projects/Documents/ -type d

# カレントの下階層を絶対パス・ファイル名・表示
find `pwd` -name '*.sh'

# カレントの下を一階層だけ・ファイル名・表示
find . -maxdepth 1 -name '*.sh'

# カレントの下を一階層だけ・ディレクトリのみ・表示
find . -maxdepth 1 -type d

# -not -path -> 除外条件の指定
# カレント下階層・"*/.git/*"以外のファイル全部・表示
find . -name "*" -not -path "*/.git/*" -type f
find . -name "*" \
     -not -path "*/node_modules/*" \
     -not -path "*/.git/*" -type f

# -not -name -> ファイル名で除外条件の指定、ドットファイルを除外してみた
find ~ -mindepth 1 -maxdepth 1 -not -name ".*" -type d

# note-express の下にある各プロジェクトを表示
cd ~/Projects/note-express
find . -maxdepth 1 -not -path './.git' -not -path '.' -type d

# note-express の下にある各プロジェクトにコマンド実行
find . -maxdepth 1 -not -path './.git' -not -path '.' -type d \
  -exec cp message.txt {} \;
