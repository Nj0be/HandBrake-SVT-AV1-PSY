#!/bin/bash
cd "$(dirname "$0")"

if [ "$1" = "--force" ]; then
	rm -rf ./HandBrake
fi

if [ -d "HandBrake" ]; then
    echo HandBrake directory already present, please use --force if you want to overwrite it
	exit 1
fi

git clone https://github.com/HandBrake/HandBrake.git
for filename in patches/*.patch; do
    patch -t -N -p1 -d HandBrake < "$filename"
done
