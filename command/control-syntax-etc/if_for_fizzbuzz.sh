# fizzbuzz
for i in {1..20}; do
  if [ $(( $i % 5 )) = 0 -a $(( $i % 3 )) = 0 ] ; then
    echo "fizzbuzz"
  elif [ $(( $i % 3 )) = 0 ] ; then
    echo "fizz"
  elif [ $(( $i % 5 )) = 0 ] ; then
    echo "buzz"
  else
    echo $i
  fi
done

# 正規表現で文字列を含むの判定
TEXT='This is an apple.'
if [[ $TEXT =~ apple.$ ]]; then
  echo 'YES'
else
  echo 'NO'
fi
