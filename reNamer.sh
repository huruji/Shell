#!/bin/bash -v


folder=$1
patternBefroe=''
patternAfter=''
files=()

function reName(){
	i=1
	for file in files
	do
		ext=${file##*.}
		oriName="${folder}/${file}"
		if [[ $file != $ext ]]; then
			name="${folder}/${patternBefroe}${i}${patternAfter}.$ext"
		else
			name="${folder}/${patternBefroe}${i}${patternAfter}"
		fi
		`mv $oriName $name`
		((i++))
	done

	echo "done"
}

if [[ ${docu:0:1} = "-" ]]; then
	folder=`pwd`
fi



if [[ ! -d $folder ]]; then
	echo "$folder is not exists!"
else
	while getopts "p:e:a" arg
	do
		case $arg in
			a)
			files=`ls $folder -l`
			;;
			e)
				files=`ls $folder -l | grep '.$OPTARG'`
			;;
			p)
				patternBefroe=${OPTARG%%/.*}
				patternAfter=${OPTARG##*/.}
			;;
		esac
	done
	echo ${files[*]}
	echo "patternAfter=$patternAfter"
	echo "patternBefroe=$patternBefroe"
	echo "floder=$folder"
	reName

fi



# if [[ $1 ]]; then
# 	document=$1
# else
# 	document=`pwd`
# fi

