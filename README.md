# HandBrake-SVT-AV1-SPY
## Purpose of the project
This project contains the patches needed to replace SVT-AV1 with SVT-AV1-PSY inside HandBrake.\
In addition, using GitHub CI I will build and release patched executables for Linux/MacOs/Windows/Windows(ARM).
## Instructions to patch/build
* Run ```patch.sh``` on linux. The script will clone the HandBrake repo and it will patch it
* Compile for the desired platform using the commands provided on the HandBrake wiki ([BSD](https://handbrake.fr/docs/en/latest/developer/build-bsd.html) [Linux](https://handbrake.fr/docs/en/latest/developer/build-linux.html) [Mac](https://handbrake.fr/docs/en/latest/developer/build-mac.html) [Windows](https://handbrake.fr/docs/en/latest/developer/build-windows.html))
## Testing
I can currently only test the custom build on linux. Help for testing on other platforms would be helpful.
## Special thanks
A special thanks to [vincejv (Docker container for HandBrake)](https://github.com/vincejv/docker-handbrake) from which I took inspiration for some patches.

