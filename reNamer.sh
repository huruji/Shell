#!/bin/bash -v

if [[ $1 ]]; then
	document=$1
else
	document=`pwd`
fi

i=1
for files in `ls $1`
do
	ext=${files##*.}
	oriName="${document}/${files}"
	if [[ $files != $ext ]]; then
		name="${document}/${i}.$ext"
	else
		name="${document}/${i}"
	fi
	`mv $oriName $name`
	((i++))
done

echo "done"