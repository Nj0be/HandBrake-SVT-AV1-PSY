#!/bin/bash

BASEDIR=$(dirname "$0")
src_dir="HandBrake"
help="Usage: patch.sh [src_dir=\"HandBrake\"] [options]

The src_dir is the directory that contains the HandBrake source code (defaults to \"HandBrake\)
-c --clone -> option that clone the repo to src_dir
-h --help  -> print usage message

If no directory is found, the program exits"

if [ "$#" -gt 2 ]; then
    echo "$help"
	exit 1
fi


for (( i=1; i <= "$#"; i++ )); do
	case ${!i} in
		-h | --help)
			echo "$help"
			exit 1
			;;
		-c | --clone)
			if [ "$i" -lt "$#" ]; then
				echo "$help"
				exit 1
			fi
			rm -rf HandBrake
			git clone https://github.com/HandBrake/HandBrake.git
			;;
		-*)
			echo "${!i} option doesn't exists!"
			echo "$help"
			exit 1
			;;
		*)
			src_dir=$1
			;;
	esac
done

if [ ! -d "$src_dir" ]; then
	echo "$src_dir directory doesn't exists!"
	echo "$help"
	exit 1
fi


for filename in $BASEDIR/patches/*.patch; do
    patch -t -N -p1 -d $src_dir < "$filename"  || exit 1
done

# The flatpak build refers to the latest commit, so we add a commit that includes the patches
cd $src_dir
git add .
git -c user.name='deadbeef' -c user.email='deadbeef' commit -m "Patch"
