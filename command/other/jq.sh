# "scripts" に対応する値が返ってくる
cd ~/Projects/note-typescript
cat package.json | jq ".scripts"

# さらに一階層下を取る
cat package.json | jq ".scripts" | jq ".lint"
