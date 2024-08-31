# HandBrake-SVT-AV1-SPY
# Purpose of the project
This project contains the patches needed to replace SVT-AV1 with SVT-AV1-PSY inside HandBrake.\
In addition, using GitHub Actions, nightly build of patched executables will be released.
# Instructions to patch/build
* Run ```patch.sh``` on linux. The script will patch the previously cloned HandBrake repo. If you want to also clone it you can use ```--clone``` argument.
* Compile for the desired platform using the commands provided on the HandBrake wiki ([BSD](https://handbrake.fr/docs/en/latest/developer/build-bsd.html), [Linux](https://handbrake.fr/docs/en/latest/developer/build-linux.html), [Mac](https://handbrake.fr/docs/en/latest/developer/build-mac.html), [Windows](https://handbrake.fr/docs/en/latest/developer/build-windows.html))
# Downloads and Build Status
| Operating System  | Download        | Build Status *1 |
| ----------------- | --------------- | ------------- |
| Windows           | [Download](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/releases/tag/win) | [![Windows Build](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/actions/workflows/nightly-win.yml/badge.svg)](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/actions/workflows/nightly-win.yml)  |
| macOS             | [Download](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/releases/tag/mac) | [![macOS build](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/actions/workflows/nightly-mac.yml/badge.svg)](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/actions/workflows/nightly-mac.yml)  |
| Linux (Flatpak)   | [Download](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/releases/tag/lin) | [![Flatpak Build](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/actions/workflows/nightly-linux.yml/badge.svg)](https://github.com/Nj0be/HandBrake-SVT-AV1-PSY/actions/workflows/nightly-linux.yml) |

*1 Please note that if a build is marked as failed, previous builds may still be available for download!
# Testing
I can currently only test the custom build on linux. Help for testing on other platforms would be helpful.
## Special thanks
A special thanks to [vincejv (Docker container for HandBrake)](https://github.com/vincejv/docker-handbrake) from which I took inspiration for some patches.

