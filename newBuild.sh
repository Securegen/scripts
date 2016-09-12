#!/bin/bash -e

if [ -z ${cmHome+x} ]; then 
	read -p "Where do you want to start the build: " -e dir
	cmHome=$dir/cm13.0 
fi

if [ -d "$cmHome" ]; then
	echo "A build already exists there."
	while true; do
		read -p "Do you wish to replace it with a new one? [y/n]" yn
		case $yn in
			[Yy]* ) echo "Removing old one..."
				rm -rf $cmHome
				echo "Done."
				mkdir -p $cmHome
				break;;
			[Nn]* ) exit;;
			* ) echo "Please answer yes or no.";;
		esac
	done
else
	mkdir -p $dir/cm13.0
fi

cd $cmHome
repo init -u https://github.com/CyanogenMod/android.git -b cm-13.0
repo sync
