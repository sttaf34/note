// 同じ階層に置いてある library.js 用の型定義ファイル

export declare function add(a: number, b: number): number

// library.js は昔書いた JavaScript のライブラリ的な扱い、
// そのライブラリを使いたいが TypeScript で書き直すのは面倒、
// なので、型定義だけを作って TypeScript に教えてあげて利用する
