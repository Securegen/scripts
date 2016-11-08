#!/bin/bash -e

if [ ! -z "$1" ]; then
	export cmHome=$1/cm13.0
	echo "A new build will be started on $cmHome"
else
	read -p "Where do you want to start the build: " -e dir
	export cmHome=$dir/cm13.0
fi

securegen="$(dirname "$(pwd)")"

bash newBuild.sh
bash removePacks.sh
bash replaceVisualId.sh
bash addPacks.sh
bash addBlobs.sh
