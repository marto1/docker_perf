#!/bin/bash
set -e

PREFIX=/virt_common/bin/
TARGET='"\/virt_common"' #escape for sed
n1=$(awk '/set -gx VIRTUAL_ENV/ {print FNR}' ${PREFIX}activate.fish)
n2=$(awk '/^setenv VIRTUAL_ENV/ {print FNR}' ${PREFIX}activate.csh)
n3=$(awk '/^VIRTUAL_ENV=/ {print FNR}' ${PREFIX}activate)
sed -i "${n1}s/.*/set -gx VIRTUAL_ENV ${TARGET}/" ${PREFIX}activate.fish
sed -i "${n2}s/.*/setenv VIRTUAL_ENV ${TARGET}/" ${PREFIX}activate.csh
sed -i "${n3}s/.*/VIRTUAL_ENV=${TARGET}/" ${PREFIX}activate


bangs=("chardetect" "easy_install-3.5" "easy_install" "pip3.5" "pip3" "pip")

for item in ${bangs[*]}
do
    echo "fixing shebang on ${PREFIX}$item"
    sed -i "1s/.*/#!\/virt_common\/bin\/python3/" ${PREFIX}${item}
done
