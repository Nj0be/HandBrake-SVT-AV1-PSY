if [ ! -d "HandBrake" ]; then
    git clone https://github.com/HandBrake/HandBrake.git
else
    rm -rf HandBrake/build
fi

for filename in patches/*.patch; do
    patch -t -N -p1 -d HandBrake < "$filename"
done
