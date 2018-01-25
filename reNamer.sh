#!/bin/bash -v


folder=`pwd`
patternBefore=''
patternAfter=''
files=()


function reName(){
	i=1
	for file in ${files[@]}
	do

		ext=${file##*.}
		oriName="${folder}/${file}"
		if [[ $file != $ext ]]; then
			name="${folder}/${patternBefore}${i}${patternAfter}.$ext"
		else
			name="${folder}/${patternBefore}${i}${patternAfter}"
		fi
		`mv $oriName $name`
		((i++))
	done

	echo "done"
}


while getopts "p:e:f:a" arg
do
	case $arg in
		a)
			all=true
		;;
		e)
			exten=$OPTARG
		;;
		p)
			pattern=$OPTARG
		;;
		f)
			folder=$OPTARG
		;;
		\?)
			echo "Invalid option: -$OPTARG"
		    exit
		;;
	esac
done


if [[ ! -d $folder ]]; then
	echo "${folder} is not a folder"
	exit
fi


if [[ $all ]]; then
	filesTemp=`ls $folder -l`
else
	if [[ $exten ]]; then
		condition=".${exten}$"
		filesTemp=`ls $folder -l | grep '^-' | grep $condition`
	else
		filesTemp=`ls $folder -l | grep '^-'`
	fi
fi


if [[ $pattern ]]; then
	patternBefore=${pattern%%.*}
	patternAfter=${pattern##*.}
fi


i=1

for file in ${filesTemp[@]}
do
	if (( i%9 == 0 )); then
		files=(${files[*]} $file)
	fi
	((i++))
done

reName



