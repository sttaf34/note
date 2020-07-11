# curl で GraphQL のエンドポイントにアクセス
curl https://snowtooth.herokuapp.com/ \
  -H 'Content-Type: application/json' \
  --data '{"query":"{ allLifts { name }}"}'
  
# 全リフトを取得
curl -s https://snowtooth.herokuapp.com/ -H 'Content-Type: application/json' --data @- << EOF | jq
{"query":"
  {
    allLifts { 
      id
      name
      status
      capacity
      night
      elevationGain
    }
  }
"}
EOF

# 条件指定して取得
curl -s https://snowtooth.herokuapp.com/ -H 'Content-Type: application/json' --data @- << EOF | jq
{"query":"
  {
    allLifts(status: HOLD) { 
      name
      status
    }
  }
"}
EOF

# レスポンスのカラム名を別名にしてみる
curl -s https://snowtooth.herokuapp.com/ -H 'Content-Type: application/json' --data @- << EOF | jq
{"query":"
  {
    allLifts(status: HOLD) {
      id
      liftName: name
    }
  }
"}
EOF

# 一対多な一つのリフトと紐づくトレイルを取得
curl -s https://snowtooth.herokuapp.com/ -H 'Content-Type: application/json' --data @- << EOF | jq
{"query":"
  {
    Lift(id: \"whirlybird\") {
      id
      name
      trailAccess {
        name
      }
    }
  }
"}
EOF
