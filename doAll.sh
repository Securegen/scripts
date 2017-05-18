#!/bin/bash -e

if [ ! -z "$1" ]; then
	export cmHome=$1/cm14.1
	echo "A new build will be started on $cmHome"
else
	read -p "Where do you want to start the build: " -e dir
	export cmHome=$dir/cm14.1
fi

bash newBuild.sh
bash removePacks.sh
bash replaceVisualId.sh
bash addPacks.sh
bash addBlobs.sh
bash buildDevices.sh ${@:2}
