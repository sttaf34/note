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
