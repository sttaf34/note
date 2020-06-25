
# ↓こんなテキストが仮にあってソートしたい場合、ヒアドキュメントを使う
# orange
# apple
# grape
cat <<EOF | sort
orange
apple
grape
EOF

# uniqコマンドはsort済でないと、ちゃんと動かないとのこと
cat <<EOF | sort | uniq
orange
apple
grape
apple
orange
EOF

# sort済をクリップボードに入れたい時
cat <<EOF | sort | clip
orange
apple
grape
EOF
