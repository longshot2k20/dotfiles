#!/bin/bash

set -x

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo you replied yes
else 
    echo no you didnt
fi

read -p "Are you sure #2? " -n 1 -r
[[ $REPLY =~ ^[Yy]$ ]] && echo "you replied yes2 again!" || echo "no you don't"

[ -d "$HOME" ] && echo "exists" || echo "not exists"
[ -d "$HOMEx" ] && echo "exists" || echo "not exists"

[ -f "/Library/Java/Extensions/mysql-connector-java-5.1.46.jar" ] && echo "exists" || echo "not exists"

#${var#Pattern}
#${var##Pattern}
#You can strip $var as per given pattern from front of $var. In this example remove /etc/ part and get a filename only, enter:
x="https://test/one/two/three/text.tar.gz"; echo ${x}
echo
#from left
x="https://test/one/two/three/text.tar.gz"; echo ${x#*/}
x="https://test/one/two/three/text.tar.gz"; echo ${x##*/}
#from right
echo
x="https://test/one/two/three/text.tar.gz"; echo ${x%three*}
x="https://test/one/two/three/text.tar.gz"; echo ${x%/*}
x="https://test/one/two/three/text.tar.gz"; echo ${x%.tar.gz }

#sed doesn't support non-greedy quantifier...
echo "foobarbaz" | sed -E 's/^foo(.*)baz$/\1/'




