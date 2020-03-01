
# スターター指定でプロジェクト生成
npx gatsby new gatsby-first https://github.com/gatsbyjs/gatsby-starter-default
npx gatsby new protein https://github.com/gatsbyjs/gatsby-starter-hello-world

# スターター指定を省略するとgatsby-starter-defaultになる
npx gatsby new gatsby-typed

# http://localhost:8000/ としてサーバ立ち上げる・プロジェクトのディレクトリで
yarn gatsby develop

# 同じLANにつながっているiPhoneから見たいときは、
# 下で立ち上げれば、PCのIPアドレスにアクセスできる
yarn gatsby develop -H 0.0.0.0
