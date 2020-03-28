# ブラウザが HTML を受け取って、画面に表示するときの大まかな流れ
- https://developers.google.com/web/fundamentals/performance/critical-rendering-path/render-tree-construction?hl=ja
- ブラウザは、受け取った HTML 文字列から DOM ツリーを構築する。
- CSS が書かれていれば CSSOM ツリーを構築する。
- DOM と CSSOM を組み合わせてレンダリングツリーを構成する。
- レンダリングツリーでレイアウトを実行して各ノードの形状を計算する。
- 各ノードを画面にペイントする。

# 見出しを考え中
- https://developers.google.com/web/fundamentals/performance/critical-rendering-path/render-blocking-css?hl=ja
- CSSOM ツリーの構築完了するまで、レンダリングは開始されない。
- なので、CSSOM ツリーの構築を速く完了したい。
- 対応の一つとしては、メディアクエリで印刷用の CSS を別ファイルにすると良い。
- 非印刷時は、レンダリングをブロックしないで処理が進む。
