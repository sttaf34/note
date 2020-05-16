# トランスパイルして main.js を生成
cd ~/Projects/note-typescript-declare/src
tsc main.ts

# --traceResolution -> モジュール解決の様子を表示する
# コマンド実行直後のログのところに自分の書いたものが表示されている
cd ~/Projects/note-typescript-declare/src
tsc --traceResolution main.ts
