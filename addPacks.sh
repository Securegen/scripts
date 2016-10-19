#!/bin/bash -e

if [ -z ${cmHome+x} ]; then
	read -p "Enter the path to the build dir: " -e cmHome;
fi

cmPackages=$cmHome/packages/apps
cmCommonFull=$cmHome/vendor/cm/config/common_full.mk

if grep -Fxq "#Packages included by Securegen" $cmCommonFull; then
	echo "Packs already added."
	echo "See our README for info on how to edit packs after inclusion."
else
	echo "Adding packages..."
	cp -R */ $cmPackages
	cat secGenPacks.txt >> $cmCommonFull
	echo "Done."
fi
