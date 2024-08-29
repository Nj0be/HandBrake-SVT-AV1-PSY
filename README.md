# HandBrake-SVT-AV1-SPY
Modified Handbrake build to replace SVT-AV1 with SVT-AV1-PSY.\
You can simply run ```patch.sh``` on linux to get the patched version of the HandBrake repository and afterwards you can build it using the commands listed on the HandBrake wiki.\
I've also copied and modified the GitHub Actions from the HandBrake repo to generate executables for every platform. It works on linux, but more patches for the GUI are needed. Help for testing on other platforms would be helpful.\
A special thanks to ```https://github.com/vincejv/docker-handbrake``` that already includes multiple patches.
