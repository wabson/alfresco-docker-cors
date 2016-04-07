#!/bin/bash

source=$1
target=$2/WEB-INF/web.xml
temp=modified-web.xml

test -z "$source" && echo "You must specify a source file" && exit 1
test -z "$target" && echo "You must specify a target webapp directory" && exit 1

test ! -f "$source" && echo "Source $source does not exist or is not a file" && exit 1
test ! -f "$target" && echo "Target directory $2 does not exist or is not a directory" && exit 1
test ! -f "$target" && echo "File WEB-INF/web.xml does not exist or is not a file in directory $2" && exit 1

sed '/<\/web-app>/d' $target > $temp
cat $source >> $temp
echo '</web-app>' >> $temp

mv $target $target.bak
mv $temp $target
