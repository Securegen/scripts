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
				echo "Old build removed."
				echo "Starting new build..."
				mkdir -p $cmHome
				break;;
			[Nn]* ) echo "Exiting..."
				exit 0;;
			* ) echo "Please answer yes or no.";;
		esac
	done
else
	echo "Starting new build..."
	mkdir -p $cmHome
fi

cd $cmHome
repo init -u https://github.com/CyanogenMod/android.git -b cm-13.0
repo sync
echo "Done."
echo "New build started at $cmHome."
