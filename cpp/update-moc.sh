#!/bin/sh

set -e
cd `dirname $0`

ALL=moc_all.cpp

echo "// This file is automatically generated by cpp/update-moc.sh" > $ALL

for file in `grep -l Q_''OBJECT *`; do
	mocfile=`echo $file | awk -F. '{print("moc_"$1".cpp")}'`
	moc $file -o `echo $file | awk -F. '{print("moc_"$1".cpp")}'`
	echo "#include \"cpp/$mocfile\"" >> $ALL
done