#!/bin/bash -e

if [ -z ${cmHome+x} ]; then
	read -p "Enter the path to the build dir: " -e cmHome;
fi

securegen="$(dirname "$(pwd)")"
securegenApps=$securegen/apps

#Check if the apps repo is present
if [ ! -d "$securegenApps" ]; then
	echo "Missing apps repo."
	echo "Downloading..."
	git clone git@github.com:Securegen/apps.git $securegenApps
fi

cmPackages=$cmHome/packages/apps
cmCommonFull=$cmHome/vendor/cm/config/common_full.mk

if grep -Fxq "#Packages included by Securegen" $cmCommonFull; then
	echo "Packs already added."
	echo "See our README for info on how to edit packs after inclusion."
else
	echo "Adding packages..."
	cp -R $securegenApps/*/ $cmPackages
	cat $securegenApps/secGenPacks.txt >> $cmCommonFull
	echo "Done."
fi
