
# ステージ状態からアンステージ状態に戻す
git reset HEAD ~/Projects/secret/memo.md

# エイリアスを作ってるのでこれでも可、↑と同じ
git unstage ~/Projects/secret/memo.md

# 完全にきれいな状態
# ↓
# エディタで編集して保存しただけの状態 ＝ アンステージ
# ↓ git add
# ステージング ＝ インデックス ＝ コミット対象
# ↓ git reset HEAD, git unstage
# 編集して保存しただけの状態 ＝ アンステージ
# ↓ git checkout
# 完全にきれいな状態
# ↓
# エディタで編集して保存しただけの状態 ＝ アンステージ
# ↓ git add
# ステージング ＝ インデックス ＝ コミット対象
# ↓ git commit
# コミット済

# 全体像のわかりやすい図解
# https://zukulog098r.com/git/
