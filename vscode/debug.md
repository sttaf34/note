# デバッグ
F5    デバッグ開始
↑F5  デバッグ終了
F5    次のブレークポイントへ
F9    ブレークポイントのトグル
F10   ステップオーバー、1行進む

# VSCode でデバッグが動くようになっているリポジトリ

## note-typescript
- F9 でブレークポイントを置く。
- F5 押すと「今開いているファイル」が実行され、デバッグモードに入り、止まる！

## note-next/jumble, note-firebase/hosting
- cd ~/Projects/note-next/jumble
- yarn develop すると「Debugger listening」と表示される。
- サイドバーをデバッグにして「Debug Next.js + Chrome」を選択する。
- F5 でデバッグ開始すると「Debugger attached」と表示される。
- デバッグ用の Chrome が立ち上がる。
- F9 で適当にブレークポイントを置く。
- ブレークポイント通るところにブラウザでアクセスすると止まる！

## note-express/hello-express
- F5 押すと src/bin/www.ts が実行され、デバッグモードに入る。
- F9 で適当にブレークポイントを置く。
- ブレークポイント通るところにブラウザでアクセスすると止まる！
