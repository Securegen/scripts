#!/bin/bash

if [ -f ./android_packs ]; then
	echo "Esse script já foi rodado e não deve ser executado novamente nessa build."
	exit 1
fi

scrip.pl `for i in $(find ./build/ ./vendor/ ./device/ -name *.mk); do grep -le  "^\s*PRODUCT_PACKAGES\s*[:+]=" $i; done`

sed "s/\s*PRODUCT_PACKAGES\s*[:+]=//g" android_packages_raw | sed s/^"\s"*'\\'*//g | sed /^$/d | sed 's/\([^\\]$\)/\1 \\/g' | sort -u | sed -e '1i\\nPRODUCT_PACKAGES += \\' > android_packs

rm -rf android_packages_raw

rm -rf /tmp/MAKE*

echo "PRONTO"

exit 0
