
# ./circleci/config.yml の文法などの確認
circleci config validate

# 手元で config.yml に書いてある job を実行できるが、結構時間がかかる
circleci local execute --job test_and_lint
