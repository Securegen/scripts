#!/bin/bash -e

if [ -z ${cmHome+x} ]; then
	if [ ! -z "$1" ]; then
		export cmHome=$1/cm14.1
		echo "A new build will be started on $cmHome"
	else
		read -p "Where do you want to start the build: " -e dir
		cmHome=$dir/cm14.1
	fi
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
echo "Initiating repo sync - `date +%D` `date +%T`" | tee -a log.txt
repo init -u https://github.com/LineageOS/android.git -b cm-14.1

for i in {0..5}; do
	repo sync
	if [ $? = 0 ]; then
		echo -e "Repo sync completed - `date +%D` `date +%T`\n" | tee -a log.txt
		echo "New build started at $cmHome."
		exit 0
	fi
	echo -e "\tRepo sync failed - `date +%D` `date +%T`" | tee -a log.txt
	if [ $i -lt 5 ]; then
		echo -e "\tTrying repo sync again- `date +%D` `date +%T`" | tee -a log.txt
	fi
done

echo "Exiting due too many fails - `date +%D` `date +%T`\n" | tee -a log.txt
exit 1
