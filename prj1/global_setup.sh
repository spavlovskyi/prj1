#!/bin/bash

set -ex
echo $PATH | grep -q $(python3 -m site --user-base)/bin || {
	echo "add $(python3 -m site --user-base)/bin to your PATH"
	exit 1
}
pip3 install --user --upgrade meson ninja conan
conan remote add -f bincrafters https://api.bintray.com/conan/bincrafters/public-conan
conan remote add -f -i 0 presentation_artifactory http://localhost:8082/artifactory/api/conan/conan-local
rm -rf out
