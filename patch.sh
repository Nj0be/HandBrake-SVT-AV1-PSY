#!/bin/bash

if [ "$1" = "--clone" ]; then
	git clone https://github.com/HandBrake/HandBrake.git
fi

if [ ! -d "HandBrake" ]; then
    echo HandBrake directory missing, please clone it with \"git clone https://github.com/HandBrake/HandBrake.git\" or use --clone argument
	exit 1
fi

for filename in patches/*.patch; do
    patch -t -N -p1 -d HandBrake < "$filename"  || exit 1
done
