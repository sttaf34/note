#
# pre-push
#

#!/bin/sh

echo "executing pre-push..."

# https://thinca.hatenablog.com/entry/20150306/1425639218
while read local_ref local_sha1 remote_ref remote_sha1
do
  if [[ "${remote_ref##refs/heads/}" = "master" ]]; then
    echo "Do not push to master branch!"
    exit 1
  fi
done

#
# pre-commit
#

#!/bin/sh

echo "executing pre-commit..."

branch=$(git rev-parse --abbrev-ref HEAD)
if [ $branch = "master" ]; then
  echo "Do not commit to master branch!"
  exit 1
fi
